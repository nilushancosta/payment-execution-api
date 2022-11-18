import ballerina/http;
import ballerina/log;


type Payment record {
    string orderId;
    float amount;
    string currency;
};


# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + payment - the payment request
    # + return - an error or anothing
    resource function post payment/execute(@http:Payload Payment payment) returns error? {
        log:printInfo("payment execution recieved", payment = payment);
    }
}
