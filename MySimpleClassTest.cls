@isTest
private class MySimpleClassTest {
    
    @isTest 
    static void testMorningGreeting() {
        // Test morning greeting
        String result = MySimpleClass.getGreeting(true);
        System.assertEquals('Good morning', result, 'Should return Good morning for true parameter');
    }
    
    @isTest 
    static void testEveningGreeting() {
        // Test evening greeting to cover the else branch
        String result = MySimpleClass.getGreeting(false);
        System.assertEquals('Good evening', result, 'Should return Good evening for false parameter');
    }
    
    @isTest 
    static void testFindUserSecurely() {
        // Test with existing user (running user)
        User currentUser = [SELECT Id, Username FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];
        
        Test.startTest();
        List<User> foundUsers = MySimpleClass.findUserSecurely(currentUser.Username);
        Test.stopTest();
        
        System.assertEquals(1, foundUsers.size(), 'Should find exactly one user');
        System.assertEquals(currentUser.Username, foundUsers[0].Username, 'Should find the correct user');
    }
    
    @isTest 
    static void testFindUserSecurelyNotFound() {
        // Test with non-existent username
        Test.startTest();
        List<User> foundUsers = MySimpleClass.findUserSecurely('nonexistent@example.com.invalid');
        Test.stopTest();
        
        System.assertEquals(0, foundUsers.size(), 'Should return empty list for non-existent user');
    }
    
    @isTest 
    static void testFindUserSecurelyBlankUsername() {
        // Test with blank username
        Test.startTest();
        List<User> foundUsers = MySimpleClass.findUserSecurely('');
        Test.stopTest();
        
        System.assertEquals(0, foundUsers.size(), 'Should return empty list for blank username');
    }
    
    @isTest 
    static void testLogSecurelyWithValidUser() {
        // Test the secure logging method with valid user
        User currentUser = [SELECT Id, Username FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];
        
        Test.startTest();
        MySimpleClass.logSecurely(currentUser.Username);
        Test.stopTest();
        
        // This method doesn't return anything, but we're testing that it executes without error
        System.assert(true, 'Method should execute without throwing exceptions');
    }
    
    @isTest 
    static void testLogSecurelyWithInvalidUser() {
        // Test the secure logging method with invalid user
        Test.startTest();
        MySimpleClass.logSecurely('nonexistent@example.com.invalid');
        Test.stopTest();
        
        // This method doesn't return anything, but we're testing that it executes without error
        System.assert(true, 'Method should execute without throwing exceptions');
    }
    
    @isTest 
    static void testLogSecurelyWithBlankUsername() {
        // Test the secure logging method with blank username
        Test.startTest();
        MySimpleClass.logSecurely('');
        Test.stopTest();
        
        // This method doesn't return anything, but we're testing that it executes without error
        System.assert(true, 'Method should execute without throwing exceptions');
    }
}
