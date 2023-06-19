package entity;

import java.util.List;

public class Phone {
    private int phoneId;
    private String name;
    private double price;
    private String description;
    private int brandId;


    public Phone(int phoneId, String name, double price, String description, int brandId) {
        this.phoneId = phoneId;
        this.name = name;
        this.price = price;
        this.description = description;
        this.brandId = brandId;
    }

    public Phone(String name, double price, String description, int brandId) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.brandId = brandId;
    }

    public int getPhoneId() {
        return phoneId;
    }

    public void setPhoneId(int phoneId) {
        this.phoneId = phoneId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    @Override
    public String toString() {
        return "Phone{" +
                "phoneId=" + phoneId +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", brandId=" + brandId +
                '}';
    }
}
