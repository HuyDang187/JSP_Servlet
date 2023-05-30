package mvctwo;

public class Student {
    private int id;
    private String firstName;
    private String lastName;

    private boolean active;

    public Student(int id, String firstName, String lastName, boolean active) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.id = id;
        this.active = active;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
