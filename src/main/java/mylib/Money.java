package mylib;

import java.util.Date;

public class Money {
	int custno;
	int salenol;
	int pcost;
	int amount;
	int price;
	String pcode;
	Date date;
	public Money() {
		// TODO Auto-generated constructor stub
	}
	public Money(int custno, int salenol, int pcost, int amount, int price, String pcode, Date date) {
		super();
		this.custno = custno;
		this.salenol = salenol;
		this.pcost = pcost;
		this.amount = amount;
		this.price = price;
		this.pcode = pcode;
		this.date = date;
	}
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public int getSalenol() {
		return salenol;
	}
	public void setSalenol(int salenol) {
		this.salenol = salenol;
	}
	public int getPcost() {
		return pcost;
	}
	public void setPcost(int pcost) {
		this.pcost = pcost;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Money [custno=" + custno + ", salenol=" + salenol + ", pcost=" + pcost + ", amount=" + amount
				+ ", price=" + price + ", pcode=" + pcode + ", date=" + date + "]";
	}
	
}
