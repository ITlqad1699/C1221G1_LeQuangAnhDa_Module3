package model.service;

public class RentalType {
    private Integer rentalTypeId;
    private String rentalType;

    public RentalType() {
    }

    public RentalType(Integer rentalTypeId, String rentalType) {
        this.rentalTypeId = rentalTypeId;
        this.rentalType = rentalType;
    }

    public Integer getRentalTypeId() {
        return rentalTypeId;
    }

    public void setRentalTypeId(Integer rentalTypeId) {
        this.rentalTypeId = rentalTypeId;
    }

    public String getRentalType() {
        return rentalType;
    }

    public void setRentalType(String rentalType) {
        this.rentalType = rentalType;
    }
}
