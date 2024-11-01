#include <iostream>
#include <string>
#include <vector>
#include <map>

class Flight {
public:
    std::string flightNumber;
    std::string origin;
    std::string destination;
    std::string departureTime;
    std::string arrivalTime;
    std::string imageUrl;

    Flight(std::string fn, std::string org, std::string dest, std::string dt, std::string at, std::string img)
        : flightNumber(fn), origin(org), destination(dest), departureTime(dt), arrivalTime(at), imageUrl(img) {}
};

std::vector<Flight> getAvailableFlights() {
    return {
        Flight("AA101", "New York", "Los Angeles", "2023-10-25 08:00", "2023-10-25 11:00", "LA.jpg"),
        Flight("DL202", "Chicago", "Miami", "2023-10-25 09:00", "2023-10-25 12:30", "Miami.jpg"),
        Flight("UA303", "San Francisco", "Seattle", "2023-10-25 10:00", "2023-10-25 12:30", "Seattle.jpg")
    };
}

void displayAvailableFlights() {
    std::vector<Flight> flights = getAvailableFlights();
    
    std::cout << "Content-Type: text/html\n\n";
    std::cout << "<html><head><link rel='stylesheet' type='text/css' href='style.css'></head><body>";
    std::cout << "<h1>Available Flights</h1>";
    
    for (const auto& flight : flights) {
        std::cout << "<div class='flight-card'>"
                  << "<img src='" << flight.imageUrl << "' alt='" << flight.destination << "' class='flight-image'>"
                  << "<h3>" << flight.destination << "</h3>"
                  << "<p>Flight Number: " << flight.flightNumber << "</p>"
                  << "<p>Departure: " << flight.departureTime << "</p>"
                  << "<p>Arrival: " << flight.arrivalTime << "</p>"
                  << "<a href='select_date_seat.html?flight=" << flight.flightNumber << "' class='select-button'>Select Flight</a>"
                  << "</div>";
    }
    
    std::cout << "</body></html>";
}