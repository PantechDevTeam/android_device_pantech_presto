/*
 * Copyright (C) 2011-2012 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <cutils/properties.h>

#define NV_WLAN_MAC_ADDRESS_I 0x1246

extern void nv_cmd_remote(int,int,void*);
extern void oncrpc_init();
extern void oncrpc_task_start();

int write_mac_to_file(const char *, const char *, ...);

/* Read properties and set MAC addresses accordingly 
  Get the wlan MAC from nv. This attempts to replicate the
   wifi_read_mac_address function from the stock software 
   return 0 on success, 1 - bt\2 - wifi\3 - both failed */

int main() {
	int status_bt   = 1;
	int status_wifi = 2;
	char buf[PROPERTY_VALUE_MAX] = {0};

	//read wifi mac from NV 
	oncrpc_init(); oncrpc_task_start();
	nv_cmd_remote(0, NV_WLAN_MAC_ADDRESS_I, &buf);

	if (write_mac_to_file("/data/misc/wifi/panmac", "%02x:%02x:%02x:%02x:%02x:%02x", 
		buf[2], buf[1],buf[0], buf[5],buf[4], buf[3]) != -1){
		status_wifi = 0;
	}

	//read bt mac
	property_get("service.brcm.bt.mac", buf,"000102030405");
	if (write_mac_to_file("/data/misc/bd_addr", "%c%c:%c%c:%c%c:%c%c:%c%c:%c%c\n", 
		buf[0], buf[1], buf[2], buf[3], buf[4], buf[5], buf[6],
		buf[7], buf[8], buf[9], buf[10], buf[11]) != -1){
		status_bt = 0;
	}
	return status_bt + status_wifi;
}

/* return -1 on fail or 0 on success */
int write_mac_to_file(const char *fpath, const char *format, ...){
	FILE *fd = NULL;
	int ret = -1;
	va_list args;
	va_start (args, format);

	if (!fpath || !format)
		return -1;

	if ((fd = fopen(fpath,"w")) == NULL) 
		return -1;

	if(vfprintf(fd, format, args) > 0){
		fclose(fd);
		ret = 0;
	}

   va_end (args);
   return ret;
}
