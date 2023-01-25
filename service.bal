import ballerina/io;
import ballerina/http;

# A ballerina service representing a network-accessible API
# bound to port `9090`.

configurable string greeting = ?;
configurable string[] stringArray = ?;
configurable float floatNum = ?;
configurable int[] intArray = [];

service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        io:println("string array: ", stringArray);
        io:println("int array: ", intArray);
        io:println("float number: ", floatNum);
        if name is "" {
            return error("name should not be empty!");
        }
        return greeting + ", " + name;
    }
}
