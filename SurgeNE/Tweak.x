#include <mach-o/dyld.h>
#include <mach/mach.h> 
#import <substrate.h>

typedef void (*MSHookMemory_ptr_t)(void *target, const void *data, size_t size);
%hook PacketTunnelProvider

typedef void (*SGNSASetParameterDirectly)(void);
-(void)startup{
	SGNSASetParameterDirectly target = (SGNSASetParameterDirectly)(_dyld_get_image_vmaddr_slide(0) + 0x100105754);
	(*target)();
	*(int*)(_dyld_get_image_vmaddr_slide(0)+0x1003D9648)=2;
	*(int*)(_dyld_get_image_vmaddr_slide(0)+0x1003D964C)=3;
	return %orig;
}
%end

