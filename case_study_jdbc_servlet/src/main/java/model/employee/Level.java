package model.employee;

public class Level {
    private Integer levelId;
    private String level;

    public Level() {
    }

    public Level(Integer levelId, String level) {
        this.levelId = levelId;
        this.level = level;
    }

    public Integer getLevelId() {
        return levelId;
    }

    public void setLevelId(Integer levelId) {
        this.levelId = levelId;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
