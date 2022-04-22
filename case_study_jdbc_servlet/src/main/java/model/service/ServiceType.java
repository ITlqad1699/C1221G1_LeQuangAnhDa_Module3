package model.service;

public class ServiceType {
    private Integer serviceTypeId;
    private String serviceType;

    public ServiceType() {
    }

    public ServiceType(Integer serviceTypeId, String serviceType) {
        this.serviceTypeId = serviceTypeId;
        this.serviceType = serviceType;
    }

    public Integer getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(Integer serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }
}
