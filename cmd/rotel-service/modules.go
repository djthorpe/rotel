/*
	Rotel RS232 Control
	(c) Copyright David Thorpe 2019
	All Rights Reserved
	For Licensing and Usage information, please see LICENSE file
*/

package main

import (
	// Modules
	_ "github.com/djthorpe/gopi-rpc/sys/dns-sd"
	_ "github.com/djthorpe/gopi-rpc/sys/grpc"
	_ "github.com/djthorpe/gopi/sys/logger"
	_ "github.com/djthorpe/rotel/sys/rotel"

	// Services
	_ "github.com/djthorpe/rotel/rpc/grpc/rotel"
)
