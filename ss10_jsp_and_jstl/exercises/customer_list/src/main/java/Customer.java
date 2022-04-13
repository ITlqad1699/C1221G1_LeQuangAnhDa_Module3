
public class Customer  {
    private int id;
    private boolean gender;
    private String fullName;
    private String birthDay;
    private String address;
    private String image;
    private int score;

    public Customer( ) {

    }

    public Customer(int id,String fullName, String birthDay, String address,String image, boolean gender, int score) {
        this.id = id;
        this.fullName = fullName;
        this.birthDay = birthDay;
        this.address = address;
        this.image = image;
        this.gender = gender;
        this.score = score;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
