package mylib;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

	public static void main(String[] args) throws ParseException {
		Date date=new Date();
		System.out.println(date);
		System.out.println(new String(date.toString()));
		
		//Date��ü�� ��¥�� ��ü�� �����Ͽ� ���� ������ �ȵ�
		//�Ʒ��ڵ�� ������ �߻�
		//Date d2=new Date("2020-01-02");
		
		//���� ��¥ ������ ����
		//->SimpleDateFormat���� parse�Լ��� ����Ͽ� ���ڿ��� ������ �������� ����
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		Date d=sdf.parse("20220103");
		System.out.println(d.toString()); //Date�� ǥ�������� ���
		System.out.println(sdf.format(d));//SimpleDateFormat�� �̿��Ͽ� ���˵� ��¥�� ����
		
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
		String sdata=sdf2.format(d);
		System.out.println(sdata);
		
		SimpleDateFormat sdf3=new SimpleDateFormat("yyyy��MM��dd��");
		System.out.println(sdf3.format(new Date()));
		

	}

}
