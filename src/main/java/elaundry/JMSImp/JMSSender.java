package elaundry.JMSImp;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

import elaundry.JMS.JMSInterface;
import elaundry.domain.SOrder;


public class JMSSender implements JMSInterface{
    private JmsTemplate jmsTemplate;
    
    
    public void send(final SOrder order) {
        jmsTemplate.send(new MessageCreator() {
              public Message createMessage(Session session) throws JMSException {
                return session.createObjectMessage(order);
              }
        });            
        System.out.println("Sending message to clinet status changed: " + order.getOrderStatus());
    }

    public void setJmsTemplate(JmsTemplate jmsTemplate) {
        this.jmsTemplate = jmsTemplate;
    }

}
