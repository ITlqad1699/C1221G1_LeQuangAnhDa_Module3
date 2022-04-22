package model.customer;

public class Customer {
    private Integer id;
    private String name;
    private String birthDay;
    private Integer gender;
    private Integer citizenId;
    private Integer numberPhone;
    private String email;
    private String address;
    private Integer customerTypeId;
    private String customerCode;

    public Customer() {
    }


    public Customer(Integer id, String name, String birthDay, Integer gender, Integer citizenId, Integer numberPhone, String email, String address, Integer customerTypeId, String customerCode) {
        this.id = id;
        this.name = name;
        this.birthDay = birthDay;
        this.gender = gender;
        this.citizenId = citizenId;
        this.numberPhone = numberPhone;
        this.email = email;
        this.address = address;
        this.customerTypeId = customerTypeId;
        this.customerCode = customerCode;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getCitizenId() {
        return citizenId;
    }

    public void setCitizenId(Integer citizenId) {
        this.citizenId = citizenId;
    }

    public Integer getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(Integer numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(Integer customerTypeId) {
        this.customerTypeId = customerTypeId;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", birthDay='" + birthDay + '\'' +
                ", gender=" + gender +
                ", citizenId=" + citizenId +
                ", numberPhone=" + numberPhone +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", customerTypeId=" + customerTypeId +
                '}';
    }
}
