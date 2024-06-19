//! NOTE: this file is autogenerated, DO NOT MODIFY
//--------------------------------------------------------------------------------
// Section: Constants (0)
//--------------------------------------------------------------------------------

//--------------------------------------------------------------------------------
// Section: Types (4)
//--------------------------------------------------------------------------------
const IID_IHolographicCameraInterop_Value = Guid.initString("7cc1f9c5-6d02-41fa-9500-e1809eb48eec");
pub const IID_IHolographicCameraInterop = &IID_IHolographicCameraInterop_Value;
pub const IHolographicCameraInterop = extern struct {
    pub const VTable = extern struct {
        base: IInspectable.VTable,
        CreateDirect3D12BackBufferResource: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicCameraInterop,
                pDevice: ?*ID3D12Device,
                pTexture2DDesc: ?*D3D12_RESOURCE_DESC,
                ppCreatedTexture2DResource: ?*?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicCameraInterop,
                pDevice: ?*ID3D12Device,
                pTexture2DDesc: ?*D3D12_RESOURCE_DESC,
                ppCreatedTexture2DResource: ?*?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
        CreateDirect3D12HardwareProtectedBackBufferResource: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicCameraInterop,
                pDevice: ?*ID3D12Device,
                pTexture2DDesc: ?*D3D12_RESOURCE_DESC,
                pProtectedResourceSession: ?*ID3D12ProtectedResourceSession,
                ppCreatedTexture2DResource: ?*?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicCameraInterop,
                pDevice: ?*ID3D12Device,
                pTexture2DDesc: ?*D3D12_RESOURCE_DESC,
                pProtectedResourceSession: ?*ID3D12ProtectedResourceSession,
                ppCreatedTexture2DResource: ?*?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
        AcquireDirect3D12BufferResource: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicCameraInterop,
                pResourceToAcquire: ?*ID3D12Resource,
                pCommandQueue: ?*ID3D12CommandQueue,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicCameraInterop,
                pResourceToAcquire: ?*ID3D12Resource,
                pCommandQueue: ?*ID3D12CommandQueue,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
        AcquireDirect3D12BufferResourceWithTimeout: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicCameraInterop,
                pResourceToAcquire: ?*ID3D12Resource,
                pCommandQueue: ?*ID3D12CommandQueue,
                duration: u64,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicCameraInterop,
                pResourceToAcquire: ?*ID3D12Resource,
                pCommandQueue: ?*ID3D12CommandQueue,
                duration: u64,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
        UnacquireDirect3D12BufferResource: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicCameraInterop,
                pResourceToUnacquire: ?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicCameraInterop,
                pResourceToUnacquire: ?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
    };
    vtable: *const VTable,
    pub fn MethodMixin(comptime T: type) type { return struct {
        pub usingnamespace IInspectable.MethodMixin(T);
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicCameraInterop_CreateDirect3D12BackBufferResource(self: *const T, pDevice: ?*ID3D12Device, pTexture2DDesc: ?*D3D12_RESOURCE_DESC, ppCreatedTexture2DResource: ?*?*ID3D12Resource) callconv(.Inline) HRESULT {
            return @as(*const IHolographicCameraInterop.VTable, @ptrCast(self.vtable)).CreateDirect3D12BackBufferResource(@as(*const IHolographicCameraInterop, @ptrCast(self)), pDevice, pTexture2DDesc, ppCreatedTexture2DResource);
        }
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicCameraInterop_CreateDirect3D12HardwareProtectedBackBufferResource(self: *const T, pDevice: ?*ID3D12Device, pTexture2DDesc: ?*D3D12_RESOURCE_DESC, pProtectedResourceSession: ?*ID3D12ProtectedResourceSession, ppCreatedTexture2DResource: ?*?*ID3D12Resource) callconv(.Inline) HRESULT {
            return @as(*const IHolographicCameraInterop.VTable, @ptrCast(self.vtable)).CreateDirect3D12HardwareProtectedBackBufferResource(@as(*const IHolographicCameraInterop, @ptrCast(self)), pDevice, pTexture2DDesc, pProtectedResourceSession, ppCreatedTexture2DResource);
        }
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicCameraInterop_AcquireDirect3D12BufferResource(self: *const T, pResourceToAcquire: ?*ID3D12Resource, pCommandQueue: ?*ID3D12CommandQueue) callconv(.Inline) HRESULT {
            return @as(*const IHolographicCameraInterop.VTable, @ptrCast(self.vtable)).AcquireDirect3D12BufferResource(@as(*const IHolographicCameraInterop, @ptrCast(self)), pResourceToAcquire, pCommandQueue);
        }
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicCameraInterop_AcquireDirect3D12BufferResourceWithTimeout(self: *const T, pResourceToAcquire: ?*ID3D12Resource, pCommandQueue: ?*ID3D12CommandQueue, duration: u64) callconv(.Inline) HRESULT {
            return @as(*const IHolographicCameraInterop.VTable, @ptrCast(self.vtable)).AcquireDirect3D12BufferResourceWithTimeout(@as(*const IHolographicCameraInterop, @ptrCast(self)), pResourceToAcquire, pCommandQueue, duration);
        }
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicCameraInterop_UnacquireDirect3D12BufferResource(self: *const T, pResourceToUnacquire: ?*ID3D12Resource) callconv(.Inline) HRESULT {
            return @as(*const IHolographicCameraInterop.VTable, @ptrCast(self.vtable)).UnacquireDirect3D12BufferResource(@as(*const IHolographicCameraInterop, @ptrCast(self)), pResourceToUnacquire);
        }
    };}
    pub usingnamespace MethodMixin(@This());
};

const IID_IHolographicCameraRenderingParametersInterop_Value = Guid.initString("f75b68d6-d1fd-4707-aafd-fa6f4c0e3bf4");
pub const IID_IHolographicCameraRenderingParametersInterop = &IID_IHolographicCameraRenderingParametersInterop_Value;
pub const IHolographicCameraRenderingParametersInterop = extern struct {
    pub const VTable = extern struct {
        base: IInspectable.VTable,
        CommitDirect3D12Resource: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicCameraRenderingParametersInterop,
                pColorResourceToCommit: ?*ID3D12Resource,
                pColorResourceFence: ?*ID3D12Fence,
                colorResourceFenceSignalValue: u64,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicCameraRenderingParametersInterop,
                pColorResourceToCommit: ?*ID3D12Resource,
                pColorResourceFence: ?*ID3D12Fence,
                colorResourceFenceSignalValue: u64,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
        CommitDirect3D12ResourceWithDepthData: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicCameraRenderingParametersInterop,
                pColorResourceToCommit: ?*ID3D12Resource,
                pColorResourceFence: ?*ID3D12Fence,
                colorResourceFenceSignalValue: u64,
                pDepthResourceToCommit: ?*ID3D12Resource,
                pDepthResourceFence: ?*ID3D12Fence,
                depthResourceFenceSignalValue: u64,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicCameraRenderingParametersInterop,
                pColorResourceToCommit: ?*ID3D12Resource,
                pColorResourceFence: ?*ID3D12Fence,
                colorResourceFenceSignalValue: u64,
                pDepthResourceToCommit: ?*ID3D12Resource,
                pDepthResourceFence: ?*ID3D12Fence,
                depthResourceFenceSignalValue: u64,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
    };
    vtable: *const VTable,
    pub fn MethodMixin(comptime T: type) type { return struct {
        pub usingnamespace IInspectable.MethodMixin(T);
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicCameraRenderingParametersInterop_CommitDirect3D12Resource(self: *const T, pColorResourceToCommit: ?*ID3D12Resource, pColorResourceFence: ?*ID3D12Fence, colorResourceFenceSignalValue: u64) callconv(.Inline) HRESULT {
            return @as(*const IHolographicCameraRenderingParametersInterop.VTable, @ptrCast(self.vtable)).CommitDirect3D12Resource(@as(*const IHolographicCameraRenderingParametersInterop, @ptrCast(self)), pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue);
        }
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicCameraRenderingParametersInterop_CommitDirect3D12ResourceWithDepthData(self: *const T, pColorResourceToCommit: ?*ID3D12Resource, pColorResourceFence: ?*ID3D12Fence, colorResourceFenceSignalValue: u64, pDepthResourceToCommit: ?*ID3D12Resource, pDepthResourceFence: ?*ID3D12Fence, depthResourceFenceSignalValue: u64) callconv(.Inline) HRESULT {
            return @as(*const IHolographicCameraRenderingParametersInterop.VTable, @ptrCast(self.vtable)).CommitDirect3D12ResourceWithDepthData(@as(*const IHolographicCameraRenderingParametersInterop, @ptrCast(self)), pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue, pDepthResourceToCommit, pDepthResourceFence, depthResourceFenceSignalValue);
        }
    };}
    pub usingnamespace MethodMixin(@This());
};

const IID_IHolographicQuadLayerInterop_Value = Guid.initString("cfa688f0-639e-4a47-83d7-6b7f5ebf7fed");
pub const IID_IHolographicQuadLayerInterop = &IID_IHolographicQuadLayerInterop_Value;
pub const IHolographicQuadLayerInterop = extern struct {
    pub const VTable = extern struct {
        base: IInspectable.VTable,
        CreateDirect3D12ContentBufferResource: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicQuadLayerInterop,
                pDevice: ?*ID3D12Device,
                pTexture2DDesc: ?*D3D12_RESOURCE_DESC,
                ppTexture2DResource: ?*?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicQuadLayerInterop,
                pDevice: ?*ID3D12Device,
                pTexture2DDesc: ?*D3D12_RESOURCE_DESC,
                ppTexture2DResource: ?*?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
        CreateDirect3D12HardwareProtectedContentBufferResource: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicQuadLayerInterop,
                pDevice: ?*ID3D12Device,
                pTexture2DDesc: ?*D3D12_RESOURCE_DESC,
                pProtectedResourceSession: ?*ID3D12ProtectedResourceSession,
                ppCreatedTexture2DResource: ?*?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicQuadLayerInterop,
                pDevice: ?*ID3D12Device,
                pTexture2DDesc: ?*D3D12_RESOURCE_DESC,
                pProtectedResourceSession: ?*ID3D12ProtectedResourceSession,
                ppCreatedTexture2DResource: ?*?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
        AcquireDirect3D12BufferResource: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicQuadLayerInterop,
                pResourceToAcquire: ?*ID3D12Resource,
                pCommandQueue: ?*ID3D12CommandQueue,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicQuadLayerInterop,
                pResourceToAcquire: ?*ID3D12Resource,
                pCommandQueue: ?*ID3D12CommandQueue,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
        AcquireDirect3D12BufferResourceWithTimeout: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicQuadLayerInterop,
                pResourceToAcquire: ?*ID3D12Resource,
                pCommandQueue: ?*ID3D12CommandQueue,
                duration: u64,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicQuadLayerInterop,
                pResourceToAcquire: ?*ID3D12Resource,
                pCommandQueue: ?*ID3D12CommandQueue,
                duration: u64,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
        UnacquireDirect3D12BufferResource: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicQuadLayerInterop,
                pResourceToUnacquire: ?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicQuadLayerInterop,
                pResourceToUnacquire: ?*ID3D12Resource,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
    };
    vtable: *const VTable,
    pub fn MethodMixin(comptime T: type) type { return struct {
        pub usingnamespace IInspectable.MethodMixin(T);
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicQuadLayerInterop_CreateDirect3D12ContentBufferResource(self: *const T, pDevice: ?*ID3D12Device, pTexture2DDesc: ?*D3D12_RESOURCE_DESC, ppTexture2DResource: ?*?*ID3D12Resource) callconv(.Inline) HRESULT {
            return @as(*const IHolographicQuadLayerInterop.VTable, @ptrCast(self.vtable)).CreateDirect3D12ContentBufferResource(@as(*const IHolographicQuadLayerInterop, @ptrCast(self)), pDevice, pTexture2DDesc, ppTexture2DResource);
        }
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicQuadLayerInterop_CreateDirect3D12HardwareProtectedContentBufferResource(self: *const T, pDevice: ?*ID3D12Device, pTexture2DDesc: ?*D3D12_RESOURCE_DESC, pProtectedResourceSession: ?*ID3D12ProtectedResourceSession, ppCreatedTexture2DResource: ?*?*ID3D12Resource) callconv(.Inline) HRESULT {
            return @as(*const IHolographicQuadLayerInterop.VTable, @ptrCast(self.vtable)).CreateDirect3D12HardwareProtectedContentBufferResource(@as(*const IHolographicQuadLayerInterop, @ptrCast(self)), pDevice, pTexture2DDesc, pProtectedResourceSession, ppCreatedTexture2DResource);
        }
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicQuadLayerInterop_AcquireDirect3D12BufferResource(self: *const T, pResourceToAcquire: ?*ID3D12Resource, pCommandQueue: ?*ID3D12CommandQueue) callconv(.Inline) HRESULT {
            return @as(*const IHolographicQuadLayerInterop.VTable, @ptrCast(self.vtable)).AcquireDirect3D12BufferResource(@as(*const IHolographicQuadLayerInterop, @ptrCast(self)), pResourceToAcquire, pCommandQueue);
        }
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicQuadLayerInterop_AcquireDirect3D12BufferResourceWithTimeout(self: *const T, pResourceToAcquire: ?*ID3D12Resource, pCommandQueue: ?*ID3D12CommandQueue, duration: u64) callconv(.Inline) HRESULT {
            return @as(*const IHolographicQuadLayerInterop.VTable, @ptrCast(self.vtable)).AcquireDirect3D12BufferResourceWithTimeout(@as(*const IHolographicQuadLayerInterop, @ptrCast(self)), pResourceToAcquire, pCommandQueue, duration);
        }
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicQuadLayerInterop_UnacquireDirect3D12BufferResource(self: *const T, pResourceToUnacquire: ?*ID3D12Resource) callconv(.Inline) HRESULT {
            return @as(*const IHolographicQuadLayerInterop.VTable, @ptrCast(self.vtable)).UnacquireDirect3D12BufferResource(@as(*const IHolographicQuadLayerInterop, @ptrCast(self)), pResourceToUnacquire);
        }
    };}
    pub usingnamespace MethodMixin(@This());
};

const IID_IHolographicQuadLayerUpdateParametersInterop_Value = Guid.initString("e5f549cd-c909-444f-8809-7cc18a9c8920");
pub const IID_IHolographicQuadLayerUpdateParametersInterop = &IID_IHolographicQuadLayerUpdateParametersInterop_Value;
pub const IHolographicQuadLayerUpdateParametersInterop = extern struct {
    pub const VTable = extern struct {
        base: IInspectable.VTable,
        CommitDirect3D12Resource: switch (@import("builtin").zig_backend) {
            .stage1 => fn(
                self: *const IHolographicQuadLayerUpdateParametersInterop,
                pColorResourceToCommit: ?*ID3D12Resource,
                pColorResourceFence: ?*ID3D12Fence,
                colorResourceFenceSignalValue: u64,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
            else => *const fn(
                self: *const IHolographicQuadLayerUpdateParametersInterop,
                pColorResourceToCommit: ?*ID3D12Resource,
                pColorResourceFence: ?*ID3D12Fence,
                colorResourceFenceSignalValue: u64,
            ) callconv(@import("std").os.windows.WINAPI) HRESULT,
        },
    };
    vtable: *const VTable,
    pub fn MethodMixin(comptime T: type) type { return struct {
        pub usingnamespace IInspectable.MethodMixin(T);
        // NOTE: method is namespaced with interface name to avoid conflicts for now
        pub fn IHolographicQuadLayerUpdateParametersInterop_CommitDirect3D12Resource(self: *const T, pColorResourceToCommit: ?*ID3D12Resource, pColorResourceFence: ?*ID3D12Fence, colorResourceFenceSignalValue: u64) callconv(.Inline) HRESULT {
            return @as(*const IHolographicQuadLayerUpdateParametersInterop.VTable, @ptrCast(self.vtable)).CommitDirect3D12Resource(@as(*const IHolographicQuadLayerUpdateParametersInterop, @ptrCast(self)), pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue);
        }
    };}
    pub usingnamespace MethodMixin(@This());
};


//--------------------------------------------------------------------------------
// Section: Functions (0)
//--------------------------------------------------------------------------------

//--------------------------------------------------------------------------------
// Section: Unicode Aliases (0)
//--------------------------------------------------------------------------------
const thismodule = @This();
pub usingnamespace switch (@import("../../zig.zig").unicode_mode) {
    .ansi => struct {
    },
    .wide => struct {
    },
    .unspecified => if (@import("builtin").is_test) struct {
    } else struct {
    },
};
//--------------------------------------------------------------------------------
// Section: Imports (9)
//--------------------------------------------------------------------------------
const Guid = @import("../../zig.zig").Guid;
const D3D12_RESOURCE_DESC = @import("../../graphics/direct3d12.zig").D3D12_RESOURCE_DESC;
const HRESULT = @import("../../foundation.zig").HRESULT;
const ID3D12CommandQueue = @import("../../graphics/direct3d12.zig").ID3D12CommandQueue;
const ID3D12Device = @import("../../graphics/direct3d12.zig").ID3D12Device;
const ID3D12Fence = @import("../../graphics/direct3d12.zig").ID3D12Fence;
const ID3D12ProtectedResourceSession = @import("../../graphics/direct3d12.zig").ID3D12ProtectedResourceSession;
const ID3D12Resource = @import("../../graphics/direct3d12.zig").ID3D12Resource;
const IInspectable = @import("../../system/win_rt.zig").IInspectable;

test {
    @setEvalBranchQuota(
        comptime @import("std").meta.declarations(@This()).len * 3
    );

    // reference all the pub declarations
    if (!@import("builtin").is_test) return;
    inline for (comptime @import("std").meta.declarations(@This())) |decl| {
        _ = @field(@This(), decl.name);
    }
}
