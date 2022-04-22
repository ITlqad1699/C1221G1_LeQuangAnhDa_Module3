package model.employee;

public class Devision {
    private Integer devisionId;
    private String devision;

    public Devision() {
    }

    public Devision(Integer devisionId, String devision) {
        this.devisionId = devisionId;
        this.devision = devision;
    }

    public Integer getDevisionId() {
        return devisionId;
    }

    public void setDevisionId(Integer devisionId) {
        this.devisionId = devisionId;
    }

    public String getDevision() {
        return devision;
    }

    public void setDevision(String devision) {
        this.devision = devision;
    }
}
