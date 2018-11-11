package kh.com.a.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LogAOP {

	@Around("within(kh.com.a.controller.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable{
		
		String signatureStr = joinpoint.getSignature().toShortString();
		
		
		try {
			System.out.println("loggerApp: "+signatureStr + " 메소드가 실행되었음");
			Object obj = joinpoint.proceed();//핵심기능 실행
			return obj;
		} finally{
		
		}
	}
}
