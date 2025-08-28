public class MySimpleClass {
    public static String getGreeting(Boolean isMorning) {
        if (isMorning) {
            return 'Good morning';
        } else {
            return 'Good evening';
        }
    }

    public static List<User> findUserSecurely(String username) {
        // Fixed: Use parameterized query to prevent SOQL injection
        if (String.isBlank(username)) {
            return new List<User>();
        }
        
        List<User> users = [SELECT Id, Username FROM User WHERE Username = :username LIMIT 1];
        return users;
    }
    
    public static void logSecurely(String username) {
        // Fixed: Remove sensitive information from logs
        // Fixed: Remove hardcoded credentials
        if (String.isBlank(username)) {
            System.debug('Invalid username provided');
            return;
        }
        
        System.debug('Processing login request');
        
        // Use the secure method to find users
        List<User> users = findUserSecurely(username);
        
        if (!users.isEmpty()) {
            System.debug('User found successfully');
        } else {
            System.debug('User not found');
        }
    }
}
