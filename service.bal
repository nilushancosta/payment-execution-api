import ballerina/http;
import ballerina/log;


type Payment record {
    string orderId;
    float amount;
    string currency;
};

type PaymentResult record {
    string orderId;
    boolean successful;
    string description;
};

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + payment - the payment request
    # + return - an error or anothing
    resource function post payment/execute(@http:Payload Payment payment) returns PaymentResult|error {
        log:printInfo("payment execution recieved", payment = payment);
        return {
            orderId: payment.orderId,
            successful: true,
            description: "transaction completed successfully"
        };
    }
}
