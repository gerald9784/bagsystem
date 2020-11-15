package com.products.bean;

import java.sql.Date;

public class StockList {
    private String product_name;
    private String product_description;
    private int quantity;
    private double buying_price;
    private String color_name;
    private int color_quantity;
    private String size_name;
    private int size_quantity;
    private Date date_updated;
    private Date date_created;

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getBuying_price() {
        return buying_price;
    }

    public void setBuying_price(double buying_price) {
        this.buying_price = buying_price;
    }

    public String getColor_name() {
        return color_name;
    }

    public void setColor_name(String color_name) {
        this.color_name = color_name;
    }

    public int getColor_quantity() {
        return color_quantity;
    }

    public void setColor_quantity(int color_quantity) {
        this.color_quantity = color_quantity;
    }

    public String getSize_name() {
        return size_name;
    }

    public void setSize_name(String size_name) {
        this.size_name = size_name;
    }

    public int getSize_quantity() {
        return size_quantity;
    }

    public void setSize_quantity(int size_quantity) {
        this.size_quantity = size_quantity;
    }

    public Date getDate_updated() {
        return date_updated;
    }

    public void setDate_updated(Date date_updated) {
        this.date_updated = date_updated;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }
}
