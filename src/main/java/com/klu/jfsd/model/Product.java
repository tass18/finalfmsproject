package com.klu.jfsd.model;

import jakarta.persistence.*;

@Entity
@Table(name = "product_table")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", nullable = false, unique = true)
    private int id;

    @Column(name = "product_name", nullable = false)
    private String name;

    @Column(name = "product_specification", nullable = false)
    private String specification;

    @Column(name = "product_type", nullable = false)
    private String type;

    @Column(name = "product_price")
    private String price;

    @Column(name = "product_quantity")
    private String quantity = "0"; // Default value

    @Column(name = "producer_location")
    private String location;

    @Column(name = "producer_state")
    private String state; // Default value will be null if not provided

    @Column(name = "product_image")
    private String image;

    @Column(name = "image2")
    private String image2;

    @Column(name = "request")
    private Integer request = 1; // Default value

    @Column(name = "producer_contact", nullable = false)
    private String contact;

    @Column(name = "product_Date", nullable = false)
    private String date;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "farmer_id")
    private Farmer farmer;

    @Column(name = "product_farmer_id", nullable = false)
    private Integer farmerId = -1;

    @Column(name = "p_description", nullable = true)
    private String description;

    // Getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public Integer getRequest() {
        return request;
    }

    public void setRequest(Integer request) {
        this.request = request;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Farmer getFarmer() {
        return farmer;
    }

    public void setFarmer(Farmer farmer) {
        this.farmer = farmer;
    }

    public Integer getFarmerId() {
        return farmerId;
    }

    public void setFarmerId(Integer farmerId) {
        this.farmerId = farmerId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
