@isTest
private class TestDataFactoryTest {
    @isTest
    static void testCreateTestAccounts() {
        List<Account> accounts = TestDataFactory.createTestAccounts(5);
        System.assertEquals(5, accounts.size());
    }
    
    @isTest
    static void testCreateTestContacts() {
        List<Account> accounts = TestDataFactory.createTestAccounts(5);
        List<Contact> contacts = TestDataFactory.createTestContacts(accounts);
        System.assertEquals(5, contacts.size());
    }
    
    @isTest
    static void testCreateTestOpportunities() {
        List<Account> accounts = TestDataFactory.createTestAccounts(5);
        List<Opportunity> opportunities = TestDataFactory.createTestOpportunities(accounts);
        System.assertEquals(5, opportunities.size());
    }
}
