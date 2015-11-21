package elaundry.JMS;

import elaundry.domain.SOrder;

public interface JMSInterface {
    
    public void send(final SOrder order);
 
}
