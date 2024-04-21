
public class quiz_240308_PM_2_1 {
	
	public static void main(String[] args) {
		
//		2. 1 ~ 200 사이의 수 중에서 2 또는 3의 배수가 아닌 수들의 총 합을 구하시오.
		
		int sum = 0;
		
		for(int i = 1; i <= 200; i++) {
			if(!(i % 2 == 0 || i % 3 == 0)) {
				sum += i;
			
			}
		}
		System.out.println("2의 배수 3의 배수 아닌 총 합 :" + sum);
	}
}
