package model.employee;

public class Employee {
    private Integer id;
    private String name;
    private String birthDay;
    private Integer citizenId;
    private Double salary;
    private Integer numberPhone;
    private String email;
    private String address;
    private Integer positionlId;
    private Integer levelId;
    private Integer devisionId;

    public Employee() {
    }

    public Employee(Integer id, String name, String birthDay, Integer citizenId, Double salary, Integer numberPhone, String email, String address, Integer positionlId, Integer levelId, Integer devisionId) {
        this.id = id;
        this.name = name;
        this.birthDay = birthDay;
        this.citizenId = citizenId;
        this.salary = salary;
        this.numberPhone = numberPhone;
        this.email = email;
        this.address = address;
        this.positionlId = positionlId;
        this.levelId = levelId;
        this.devisionId = devisionId;
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

    public Integer getCitizenId() {
        return citizenId;
    }

    public void setCitizenId(Integer citizenId) {
        this.citizenId = citizenId;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
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

    public Integer getPositionlId() {
        return positionlId;
    }

    public void setPositionlId(Integer positionlId) {
        this.positionlId = positionlId;
    }

    public Integer getLevelId() {
        return levelId;
    }

    public void setLevelId(Integer levelId) {
        this.levelId = levelId;
    }

    public Integer getDevisionId() {
        return devisionId;
    }

    public void setDevisionId(Integer devisionId) {
        this.devisionId = devisionId;
    }
}
