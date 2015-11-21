package elaundry.Aspect;

import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class TraceAdvice {
	@Before("execution(* elaundry.serviceImp.*.add(..)) || execution(* elaundry.serviceImp.*.update(..))")
	public void tracebeforemethod(JoinPoint joinpoint) {
		System.out.println("[INFO]---"+ new Date() + "Called Service method =  " + joinpoint.getSignature().getName());
	}
}
