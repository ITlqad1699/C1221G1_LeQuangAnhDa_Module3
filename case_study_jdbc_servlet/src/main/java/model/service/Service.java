package model.service;

public class Service {
    private Integer serviceId;
    private String name;
    private Double area;
    private Double cost;
    private Integer maxPeople;
    private String roomStandard;
    private String other;
    private Double swimmingPoolArea;
    private Integer floorNum;
    private Integer rentalTypeId;
    private Integer serviceTypeId;

    public Service() {
    }

    public Service(Integer serviceId, String name, Double area, Double cost, Integer maxPeople, String roomStandard, String other, Double swimmingPoolArea, Integer floorNum, Integer rentalTypeId, Integer serviceTypeId) {
        this.serviceId = serviceId;
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.maxPeople = maxPeople;
        this.roomStandard = roomStandard;
        this.other = other;
        this.swimmingPoolArea = swimmingPoolArea;
        this.floorNum = floorNum;
        this.rentalTypeId = rentalTypeId;
        this.serviceTypeId = serviceTypeId;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public Integer getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(Integer maxPeople) {
        this.maxPeople = maxPeople;
    }

    public String getRoomStandard() {
        return roomStandard;
    }

    public void setRoomStandard(String roomStandard) {
        this.roomStandard = roomStandard;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public Double getSwimmingPoolArea() {
        return swimmingPoolArea;
    }

    public void setSwimmingPoolArea(Double swimmingPoolArea) {
        this.swimmingPoolArea = swimmingPoolArea;
    }

    public Integer getFloorNum() {
        return floorNum;
    }

    public void setFloorNum(Integer floorNum) {
        this.floorNum = floorNum;
    }

    public Integer getRentalTypeId() {
        return rentalTypeId;
    }

    public void setRentalTypeId(Integer rentalTypeId) {
        this.rentalTypeId = rentalTypeId;
    }

    public Integer getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(Integer serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }
}
