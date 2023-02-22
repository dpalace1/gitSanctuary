public with sharing class TestDataFactory {
    public static List<Account> createTestAccounts(Integer numAccounts) {
        List<Account> accounts = new List<Account>();
        
        for (Integer i = 0; i < numAccounts; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i;
            accounts.add(acc);
        }
        
        insert accounts;
        return accounts;
    }
    
    public static List<Contact> createTestContacts(List<Account> accounts) {
        List<Contact> contacts = new List<Contact>();
        
        for (Account acc : accounts) {
            Contact con = new Contact();
            con.FirstName = 'Test';
            con.LastName = 'Contact';
            con.AccountId = acc.Id;
            contacts.add(con);
        }
        
        insert contacts;
        return contacts;
    }
    
    public static List<Opportunity> createTestOpportunities(List<Account> accounts) {
        List<Opportunity> opportunities = new List<Opportunity>();
        
        for (Account acc : accounts) {
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opportunity';
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today().addDays(30);
            opp.AccountId = acc.Id;
            opportunities.add(opp);
        }
        
        insert opportunities;
        return opportunities;
    }
}

/*
This TestDataFactory class provides three methods:

createTestAccounts: This method creates a specified number of test Accounts with unique names and returns them in a List<Account>.

createTestContacts: This method creates a new Contact for each Account in the input List<Account> and returns them in a List<Contact>. 

The Contact objects are given a first name of "Test", a last name of "Contact", and are linked to their corresponding Account through the AccountId field.

createTestOpportunities: This method creates a new Opportunity for each Account in the input List<Account> and returns them in a List<Opportunity>. 

The Opportunity objects are given a name of "Test Opportunity", a StageName of "Prospecting", and a CloseDate of 30 days from the current date. 

They are also linked to their corresponding Account through the AccountId field.
*/