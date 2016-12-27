require 'vertx-exec/stream_input'
require 'vertx/vertx'
require 'vertx-exec/stream_output'
require 'vertx/util/utils.rb'
# Generated from io.vertx.ext.childprocess.Process
module VertxExec
  class Process
    # @private
    # @param j_del [::VertxExec::Process] the java delegate
    def initialize(j_del)
      @j_del = j_del
    end
    # @private
    # @return [::VertxExec::Process] the underlying java delegate
    def j_del
      @j_del
    end
    # @return [Hash{String => String}] the current process environment variables
    def self.env
      if !block_given?
        return Java::IoVertxLangRuby::Helper.adaptingMap(Java::IoVertxExtChildprocess::Process.java_method(:env, []).call(), Proc.new { |val| ::Vertx::Util::Utils.from_object(val) }, Proc.new { |val| ::Vertx::Util::Utils.to_string(val) })
      end
      raise ArgumentError, "Invalid arguments when calling env()"
    end
    # @param [::Vertx::Vertx] vertx 
    # @param [Array<String>] commands 
    # @param [Hash] options 
    # @yield 
    # @return [void]
    def self.spawn(vertx=nil,commands=nil,options=nil)
      if vertx.class.method_defined?(:j_del) && commands.class == Array && block_given? && options == nil
        return Java::IoVertxExtChildprocess::Process.java_method(:spawn, [Java::IoVertxCore::Vertx.java_class,Java::JavaUtil::List.java_class,Java::IoVertxCore::Handler.java_class]).call(vertx.j_del,commands.map { |element| element },(Proc.new { |event| yield(::Vertx::Util::Utils.safe_create(event,::VertxExec::Process)) }))
      elsif vertx.class.method_defined?(:j_del) && commands.class == Array && options.class == Hash && block_given?
        return Java::IoVertxExtChildprocess::Process.java_method(:spawn, [Java::IoVertxCore::Vertx.java_class,Java::JavaUtil::List.java_class,Java::IoVertxExtChildprocess::ProcessOptions.java_class,Java::IoVertxCore::Handler.java_class]).call(vertx.j_del,commands.map { |element| element },Java::IoVertxExtChildprocess::ProcessOptions.new(::Vertx::Util::Utils.to_json_object(options)),(Proc.new { |event| yield(::Vertx::Util::Utils.safe_create(event,::VertxExec::Process)) }))
      end
      raise ArgumentError, "Invalid arguments when calling spawn(vertx,commands,options)"
    end
    # @yield 
    # @return [self]
    def exit_handler
      if block_given?
        @j_del.java_method(:exitHandler, [Java::IoVertxCore::Handler.java_class]).call((Proc.new { |event| yield(event) }))
        return self
      end
      raise ArgumentError, "Invalid arguments when calling exit_handler()"
    end
    # @return [::VertxExec::StreamOutput]
    def stdin
      if !block_given?
        if @cached_stdin != nil
          return @cached_stdin
        end
        return @cached_stdin = ::Vertx::Util::Utils.safe_create(@j_del.java_method(:stdin, []).call(),::VertxExec::StreamOutput)
      end
      raise ArgumentError, "Invalid arguments when calling stdin()"
    end
    # @return [::VertxExec::StreamInput]
    def stdout
      if !block_given?
        if @cached_stdout != nil
          return @cached_stdout
        end
        return @cached_stdout = ::Vertx::Util::Utils.safe_create(@j_del.java_method(:stdout, []).call(),::VertxExec::StreamInput)
      end
      raise ArgumentError, "Invalid arguments when calling stdout()"
    end
    # @return [::VertxExec::StreamInput]
    def stderr
      if !block_given?
        if @cached_stderr != nil
          return @cached_stderr
        end
        return @cached_stderr = ::Vertx::Util::Utils.safe_create(@j_del.java_method(:stderr, []).call(),::VertxExec::StreamInput)
      end
      raise ArgumentError, "Invalid arguments when calling stderr()"
    end
    #  Terminates the process.
    #  <p>
    #  If <code>force</code> is <code>false</code>, the process will be terminated gracefully (i.e. its shutdown logic will
    #  be allowed to execute), assuming the OS supports such behavior. Note that the process may not actually
    #  terminate, as its cleanup logic may fail or it may choose to ignore the termination request. If a guarantee
    #  of termination is required, call this method with force equal to true instead.
    #  <p>
    #  If <code>force</code> is <code>true</code>, the process is guaranteed to terminate, but whether it is terminated
    #  gracefully or not is OS-dependent. Note that it may take the OS a moment to terminate the process, so
    #  {::VertxExec::Process#is_running} may return <code>true</code> for a brief period after calling this method.
    # @param [true,false] force if true is passed, the process will be forcibly killed
    # @return [void]
    def destroy(force=nil)
      if (force.class == TrueClass || force.class == FalseClass) && !block_given?
        return @j_del.java_method(:destroy, [Java::boolean.java_class]).call(force)
      end
      raise ArgumentError, "Invalid arguments when calling destroy(force)"
    end
    #  Tests whether or not the process is still running or has exited.
    # @return [true,false]
    def running?
      if !block_given?
        return @j_del.java_method(:isRunning, []).call()
      end
      raise ArgumentError, "Invalid arguments when calling running?()"
    end
  end
end
