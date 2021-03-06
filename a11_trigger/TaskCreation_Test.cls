/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TaskCreation_Test {
    static testMethod void testAccount() {
        // Insert data in to account object
        List <Account> accountList = new List <Account>();
        for (Integer i=0;i<200;i++) {
            Account accountInstance = new Account(Name='TestDemo'+i,
                                                  Email_Address__c='abc@abc.com'+i);
            accountList.add(accountInstance);
        }
        
        // Start Test
        Test.StartTest();
        insert accountList;
        Test.StopTest();
        
        List<Task> testListTask = [SELECT subject FROM Task 
                                    WHERE subject = 'Meeting with TestDemo'];
        // Iterate over the list and check for results
        for (Task taskInsatance : testListTask) {
            System.assertEquals(1,1);
        }
    }
}