package model.employee;

public class Position {
    private Integer positionlId;
    private String position;

    public Position() {
    }

    public Position(Integer positionlId, String position) {
        this.positionlId = positionlId;
        this.position = position;
    }

    public Integer getPositionlId() {
        return positionlId;
    }

    public void setPositionlId(Integer positionlId) {
        this.positionlId = positionlId;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
