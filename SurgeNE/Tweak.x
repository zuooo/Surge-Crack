#include <mach-o/dyld.h>
#include <mach/mach.h> 
#import <substrate.h>


%hook PacketTunnelProvider

typedef void (*SGNSASetParameterDirectly)(void);
-(void)startup{
	SGNSASetParameterDirectly target = (SGNSASetParameterDirectly)(_dyld_get_image_vmaddr_slide(0) + 0x100105754);
	(*target)();
	return %orig;
}
%end

