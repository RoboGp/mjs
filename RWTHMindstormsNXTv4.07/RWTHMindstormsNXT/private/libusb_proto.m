function [methodinfo,structs,enuminfo,ThunkLibName]=libusb_proto
% Prototype file for library "libusb" (used in Linux USB communication)
%
% Syntax
%   [methodinfo,structs,enuminfo]=libusb_proto
%
% Description
%   This function was generated by loadlibrary.m
%
%   It is based on the libusb (Linux?) header-file usb.h, whose method
%   usb_bulk_read was modified in order to avoid returning zero-terminated
%   strings (which get truncated by MATLAB with binary data).
%
% Signature
%   Author: Linus Atorf (see AUTHORS)
%   Date: 2008/04/29
%   Copyright: 2007-2011, RWTH Aachen University
;
%
% ***********************************************************************************************
% *  This file is part of the RWTH - Mindstorms NXT Toolbox.                                    *
% *                                                                                             *
% *  The RWTH - Mindstorms NXT Toolbox is free software: you can redistribute it and/or modify  *
% *  it under the terms of the GNU General Public License as published by the Free Software     *
% *  Foundation, either version 3 of the License, or (at your option) any later version.        *
% *                                                                                             *
% *  The RWTH - Mindstorms NXT Toolbox is distributed in the hope that it will be useful,       *
% *  but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS  *
% *  FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.             *
% *                                                                                             *
% *  You should have received a copy of the GNU General Public License along with the           *
% *  RWTH - Mindstorms NXT Toolbox. If not, see <http://www.gnu.org/licenses/>.                 *
% ***********************************************************************************************

% To prevent warning 'MATLAB:loadlibrary:OldStyleMfile', this file was
% edited manually (the empty thunk-file output arg was added, just what the
% new loadlibrary generator does). We don't have a thunk-file, and we
% probably will not support 64bit platforms anyway as of now...

%This function was generated by loadlibrary.m parser version 1.1.6.20.4.1 on Tue Apr 29 10:48:12 2008
%perl options:'usb.i -outfile=libusb_proto.m'
ival={cell(1,0)}; % change 0 to the actual number of functions to preallocate the data.
fcns=struct('name',ival,'calltype',ival,'LHS',ival,'RHS',ival,'alias',ival);
structs=[];enuminfo=[];fcnNum=1;
ThunkLibName=[];
% usb_dev_handle * usb_open ( struct usb_device * dev ); 
fcns.name{fcnNum}='usb_open'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='usb_dev_handlePtr'; fcns.RHS{fcnNum}={'usb_devicePtr'};fcnNum=fcnNum+1;
% int usb_close ( usb_dev_handle * dev ); 
fcns.name{fcnNum}='usb_close'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr'};fcnNum=fcnNum+1;
% int usb_get_string ( usb_dev_handle * dev , int index , int langid , char * buf , size_t buflen ); 
fcns.name{fcnNum}='usb_get_string'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32', 'int32', 'cstring', 'uint32'};fcnNum=fcnNum+1;
% int usb_get_string_simple ( usb_dev_handle * dev , int index , char * buf , size_t buflen ); 
fcns.name{fcnNum}='usb_get_string_simple'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32', 'cstring', 'uint32'};fcnNum=fcnNum+1;
% int usb_get_descriptor_by_endpoint ( usb_dev_handle * udev , int ep , unsigned char type , unsigned char index , void * buf , int size ); 
fcns.name{fcnNum}='usb_get_descriptor_by_endpoint'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32', 'uint8', 'uint8', 'voidPtr', 'int32'};fcnNum=fcnNum+1;
% int usb_get_descriptor ( usb_dev_handle * udev , unsigned char type , unsigned char index , void * buf , int size ); 
fcns.name{fcnNum}='usb_get_descriptor'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'uint8', 'uint8', 'voidPtr', 'int32'};fcnNum=fcnNum+1;
% int usb_bulk_write ( usb_dev_handle * dev , int ep , char * bytes , int size , int timeout ); 
fcns.name{fcnNum}='usb_bulk_write'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32', 'voidPtr', 'int32', 'int32'};fcnNum=fcnNum+1;
% int usb_bulk_read ( usb_dev_handle * dev , int ep , char * bytes , int size , int timeout ); 
fcns.name{fcnNum}='usb_bulk_read'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32', 'voidPtr', 'int32', 'int32'};fcnNum=fcnNum+1;
% int usb_interrupt_write ( usb_dev_handle * dev , int ep , char * bytes , int size , int timeout ); 
fcns.name{fcnNum}='usb_interrupt_write'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32', 'cstring', 'int32', 'int32'};fcnNum=fcnNum+1;
% int usb_interrupt_read ( usb_dev_handle * dev , int ep , char * bytes , int size , int timeout ); 
fcns.name{fcnNum}='usb_interrupt_read'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32', 'cstring', 'int32', 'int32'};fcnNum=fcnNum+1;
% int usb_control_msg ( usb_dev_handle * dev , int requesttype , int request , int value , int index , char * bytes , int size , int timeout ); 
fcns.name{fcnNum}='usb_control_msg'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32', 'int32', 'int32', 'int32', 'cstring', 'int32', 'int32'};fcnNum=fcnNum+1;
% int usb_set_configuration ( usb_dev_handle * dev , int configuration ); 
fcns.name{fcnNum}='usb_set_configuration'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32'};fcnNum=fcnNum+1;
% int usb_claim_interface ( usb_dev_handle * dev , int interface ); 
fcns.name{fcnNum}='usb_claim_interface'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32'};fcnNum=fcnNum+1;
% int usb_release_interface ( usb_dev_handle * dev , int interface ); 
fcns.name{fcnNum}='usb_release_interface'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32'};fcnNum=fcnNum+1;
% int usb_set_altinterface ( usb_dev_handle * dev , int alternate ); 
fcns.name{fcnNum}='usb_set_altinterface'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32'};fcnNum=fcnNum+1;
% int usb_resetep ( usb_dev_handle * dev , unsigned int ep ); 
fcns.name{fcnNum}='usb_resetep'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'uint32'};fcnNum=fcnNum+1;
% int usb_clear_halt ( usb_dev_handle * dev , unsigned int ep ); 
fcns.name{fcnNum}='usb_clear_halt'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'uint32'};fcnNum=fcnNum+1;
% int usb_reset ( usb_dev_handle * dev ); 
fcns.name{fcnNum}='usb_reset'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr'};fcnNum=fcnNum+1;
% int usb_get_driver_np ( usb_dev_handle * dev , int interface , char * name , unsigned int namelen ); 
fcns.name{fcnNum}='usb_get_driver_np'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32', 'cstring', 'uint32'};fcnNum=fcnNum+1;
% int usb_detach_kernel_driver_np ( usb_dev_handle * dev , int interface ); 
fcns.name{fcnNum}='usb_detach_kernel_driver_np'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'usb_dev_handlePtr', 'int32'};fcnNum=fcnNum+1;
% char * usb_strerror ( void ); 
fcns.name{fcnNum}='usb_strerror'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='cstring'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% void usb_init ( void ); 
fcns.name{fcnNum}='usb_init'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}=[]; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% void usb_set_debug ( int level ); 
fcns.name{fcnNum}='usb_set_debug'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}=[]; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% int usb_find_busses ( void ); 
fcns.name{fcnNum}='usb_find_busses'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int usb_find_devices ( void ); 
fcns.name{fcnNum}='usb_find_devices'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% struct usb_device * usb_device ( usb_dev_handle * dev ); 
fcns.name{fcnNum}='usb_device'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='usb_devicePtr'; fcns.RHS{fcnNum}={'usb_dev_handlePtr'};fcnNum=fcnNum+1;
% struct usb_bus * usb_get_busses ( void ); 
fcns.name{fcnNum}='usb_get_busses'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='usb_busPtr'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
structs.usb_descriptor_header.members=struct('bLength', 'uint8', 'bDescriptorType', 'uint8');
structs.usb_string_descriptor.members=struct('bLength', 'uint8', 'bDescriptorType', 'uint8', 'wData', 'uint16#1');
structs.usb_hid_descriptor.members=struct('bLength', 'uint8', 'bDescriptorType', 'uint8', 'bcdHID', 'uint16', 'bCountryCode', 'uint8', 'bNumDescriptors', 'uint8');
structs.usb_endpoint_descriptor.members=struct('bLength', 'uint8', 'bDescriptorType', 'uint8', 'bEndpointAddress', 'uint8', 'bmAttributes', 'uint8', 'wMaxPacketSize', 'uint16', 'bInterval', 'uint8', 'bRefresh', 'uint8', 'bSynchAddress', 'uint8', 'extra', 'uint8Ptr', 'extralen', 'int32');
structs.usb_interface_descriptor.members=struct('bLength', 'uint8', 'bDescriptorType', 'uint8', 'bInterfaceNumber', 'uint8', 'bAlternateSetting', 'uint8', 'bNumEndpoints', 'uint8', 'bInterfaceClass', 'uint8', 'bInterfaceSubClass', 'uint8', 'bInterfaceProtocol', 'uint8', 'iInterface', 'uint8', 'endpoint', 'usb_endpoint_descriptorPtr', 'extra', 'uint8Ptr', 'extralen', 'int32');
structs.usb_interface.members=struct('altsetting', 'usb_interface_descriptorPtr', 'num_altsetting', 'int32');
structs.usb_config_descriptor.members=struct('bLength', 'uint8', 'bDescriptorType', 'uint8', 'wTotalLength', 'uint16', 'bNumInterfaces', 'uint8', 'bConfigurationValue', 'uint8', 'iConfiguration', 'uint8', 'bmAttributes', 'uint8', 'MaxPower', 'uint8', 'interface', 'usb_interfacePtr', 'extra', 'uint8Ptr', 'extralen', 'int32');
structs.usb_device_descriptor.members=struct('bLength', 'uint8', 'bDescriptorType', 'uint8', 'bcdUSB', 'uint16', 'bDeviceClass', 'uint8', 'bDeviceSubClass', 'uint8', 'bDeviceProtocol', 'uint8', 'bMaxPacketSize0', 'uint8', 'idVendor', 'uint16', 'idProduct', 'uint16', 'bcdDevice', 'uint16', 'iManufacturer', 'uint8', 'iProduct', 'uint8', 'iSerialNumber', 'uint8', 'bNumConfigurations', 'uint8');
structs.usb_ctrl_setup.members=struct('bRequestType', 'uint8', 'bRequest', 'uint8', 'wValue', 'uint16', 'wIndex', 'uint16', 'wLength', 'uint16');
structs.usb_device.members=struct('next', 'usb_devicePtr', 'prev', 'usb_devicePtrPtr', 'filename', 'int8#4097', 'bus', 'usb_busPtr', 'descriptor', 'usb_device_descriptor', 'config', 'usb_config_descriptorPtr', 'dev', 'voidPtr', 'devnum', 'uint8', 'num_children', 'uint8', 'children', 'usb_devicePtrPtr');
structs.usb_bus.members=struct('next', 'usb_busPtr', 'prev', 'usb_busPtrPtr', 'dirname', 'int8#4097', 'devices', 'usb_devicePtr', 'location', 'uint32', 'root_dev', 'usb_devicePtr');
structs.usb_device.members=struct('next', 'usb_devicePtr', 'prev', 'usb_devicePtrPtr', 'filename', 'int8#4097', 'bus', 'usb_busPtr', 'descriptor', 'usb_device_descriptor', 'config', 'usb_config_descriptorPtr', 'dev', 'voidPtr', 'devnum', 'uint8', 'num_children', 'uint8', 'children', 'usb_devicePtrPtr');
structs.usb_bus.members=struct('next', 'usb_busPtr', 'prev', 'usb_busPtrPtr', 'dirname', 'int8#4097', 'devices', 'usb_devicePtr', 'location', 'uint32', 'root_dev', 'usb_devicePtr');
structs.usb_dev_handle.members=struct('');
methodinfo=fcns;