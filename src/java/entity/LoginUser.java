/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author smu
 */
public class LoginUser {
    private int id;
    private int pax;
    private int budget;

    public LoginUser(String id, String pax, String budget) {
        this.id = Integer.parseInt(id);
        this.pax = Integer.parseInt(pax);
        this.budget = Integer.parseInt(budget);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPax() {
        return pax;
    }

    public void setPax(int pax) {
        this.pax = pax;
    }

    public int getBudget() {
        return budget;
    }

    public void setBudget(int budget) {
        this.budget = budget;
    }
    
}
