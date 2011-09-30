require 'ffi'

module Sapphire
  module UI
    extend FFI::Library

    ffi_lib 'user32'
    ffi_convention :stdcall
    attach_function :CreateDesktop, :CreateDesktopA, [ :string, :pointer, :pointer, :int, :long, :pointer ], :int
    attach_function :CloseDesktop, [ :int ], :bool

    ffi_lib 'kernel32'
    attach_function :CreateProcess, :CreateProcessA, [ :pointer, :pointer, :pointer, :pointer, :int, :ushort, :pointer, :pointer, :pointer, :pointer], :int
    attach_function :GetLastError, [ ], :ushort

    class StartUpInfo < FFI::Struct
      layout :cb, :ushort,
             :lpReserved, :pointer,
             :lpDesktop, :pointer,
             :lpTitle, :pointer,
             :dwX, :ushort,
             :dwY, :ushort,
             :dwXSize, :ushort,
             :dwYSize, :ushort,
             :dwXCountChars, :ushort,
             :dwYCountChars, :ushort,
             :dwFillAttribute, :ushort,
             :dwFlags, :ushort,
             :wShowWindow, :short,
             :cbReserved2, :short,
             :lpReserved2, :pointer,
             :hStdInput, :pointer,
             :hStdOutput, :pointer,
             :hStdError, :pointer
    end

    class ProcessInformation < FFI::Struct
      layout :hProcess, :pointer,
             :hThread, :pointer,
             :dwProcessId, :ushort,
             :dwThreadId, :ushort
    end

    class VirtualUI

      def Create()

        @off_screen = UI::CreateDesktop("test", nil, nil, 0, 0x02000000, nil)

        if(@off_screen == nil)
          raise "Could not create a virtual desktop :("
        end

        $isVirtual = true

      end

      def Close()
        $isVirtual = false
        result = UI::CloseDesktop(@off_screen)

        if(result == 0)
          raise "Could not close the virtual desktop :("
        end
      end
    end
  end
end