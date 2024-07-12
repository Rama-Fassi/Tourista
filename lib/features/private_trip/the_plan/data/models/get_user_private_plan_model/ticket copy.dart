

import 'package:tourista/features/private_trip/the_plan/data/models/get_user_private_plan_model/air_line_copy.dart';

class TicketCopy { 
	int? id;
	int? airlineId;
	int? airportId1;
	int? airportId2;
	String? typeOfTicket;
	String? timeOfticket;
	String? roundOrOneTrip;
	String? dateOfTicket;
	String? dateEndOfTicket;
	String? duration;
	double? price;
	int? numOfTickets;
	AirLineCopy? airLine;

	TicketCopy({
		this.id, 
		this.airlineId, 
		this.airportId1, 
		this.airportId2, 
		this.typeOfTicket, 
		this.timeOfticket, 
		this.roundOrOneTrip, 
		this.dateOfTicket, 
		this.dateEndOfTicket, 
		this.duration, 
		this.price, 
		this.numOfTickets, 
		this.airLine, 
	});

	factory TicketCopy.fromJson(Map<String, dynamic> json) => TicketCopy(
				id: json['id'] as int?,
				airlineId: json['airline_id'] as int?,
				airportId1: json['airport_id1'] as int?,
				airportId2: json['airport_id2'] as int?,
				typeOfTicket: json['typeOfTicket'] as String?,
				timeOfticket: json['timeOfticket'] as String?,
				roundOrOneTrip: json['roundOrOne_trip'] as String?,
				dateOfTicket: json['dateOfTicket'] as String?,
				dateEndOfTicket: json['dateEndOfTicket'] as String?,
				duration: json['duration'] as String?,
				price: (json['price'] as num?)?.toDouble(),
				numOfTickets: json['numOfTickets'] as int?,
				airLine: json['air_line'] == null
						? null
						: AirLineCopy.fromJson(json['air_line'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'airline_id': airlineId,
				'airport_id1': airportId1,
				'airport_id2': airportId2,
				'typeOfTicket': typeOfTicket,
				'timeOfticket': timeOfticket,
				'roundOrOne_trip': roundOrOneTrip,
				'dateOfTicket': dateOfTicket,
				'dateEndOfTicket': dateEndOfTicket,
				'duration': duration,
				'price': price,
				'numOfTickets': numOfTickets,
				'air_line': airLine?.toJson(),
			};
      
}
