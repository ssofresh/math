package vo;

import java.io.Serializable;

public class Folder implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String f1;
	private String f2;
	private String f3;

	public Folder () {}

	public Folder(String f1, String f2, String f3) {
		super();
		this.f1 = f1;
		this.f2 = f2;
		this.f3 = f3;
	}

	public String getF1() {
		return f1;
	}

	public void setF1(String f1) {
		this.f1 = f1;
	}

	public String getF2() {
		return f2;
	}

	public void setF2(String f2) {
		this.f2 = f2;
	}

	public String getF3() {
		return f3;
	}

	public void setF3(String f3) {
		this.f3 = f3;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return this.f1 + " " + this.f2 + " " + this.f3;
	}
	
}
