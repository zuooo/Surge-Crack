#include <substrate.h>
%hook SGUEnterprise
-(bool)isActive {
	return true;
}
%end