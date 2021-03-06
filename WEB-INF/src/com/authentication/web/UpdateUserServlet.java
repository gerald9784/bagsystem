package com.authentication.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import javax.servlet.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;

import com.authentication.bean.User;
import com.authentication.dao.AuthenticationDao;

@WebServlet("/updateUser")

public class UpdateUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        File file;
        int maxFileSize = 5000 * 1024;
        int maxMemSize = 5000 * 1024;

        String firstname;
        String lastname;
        HttpSession session = request.getSession();
        User user = new User();
        user.setUsername(session.getAttribute("username").toString());
        AuthenticationDao authenticationDao = new AuthenticationDao();

        ServletContext context = getServletContext();
        String filePath = context.getInitParameter("profile-upload");
        String contentType = request.getContentType();
        PrintWriter out = response.getWriter();
        if ((contentType.indexOf("multipart/form-data") >= 0)) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(maxMemSize);
            factory.setRepository(new File(filePath + "temp/"));
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax(maxFileSize);
            try {
                List fileItems = upload.parseRequest(request);
                Iterator i = fileItems.iterator();
                while (i.hasNext()) {
                    FileItem fi = (FileItem) i.next();
                    if (!fi.isFormField()) {
                        // Get the uploaded file parameters
                        String fieldName = fi.getFieldName();
                        String fileName = createFileName() + fi.getName();
                        user.setProfileImage(fileName);
                        boolean isInMemory = fi.isInMemory();
                        long sizeInBytes = fi.getSize();
                        // Write the file
                        if (fileName.lastIndexOf("\\") >= 0) {
                            file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
                        } else {
                            file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
                        }
                        fi.write(file);
                    } else {
                        String fieldname = fi.getFieldName();
                        String fieldvalue = fi.getString();
                        if (fieldname.equals("firstName")) {
                            user.setFirstName(fieldvalue);
                        }
                        if (fieldname.equals("lastName")) {
                            user.setLastName(fieldvalue);
                        }
                    }
                }
                boolean results = authenticationDao.updateUser(user);
                if (results) {
                    response.sendRedirect("profile.jsp?message=" + "user updated successfully");
                } else {
                    response.sendRedirect("profile.jsp?error=" + "failed to update user");
                }
            } catch (Exception ex) {
                response.sendRedirect("profile.jsp?error=" + "failed to update user");
            }
        }
    }

    private String createFileName() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }
}