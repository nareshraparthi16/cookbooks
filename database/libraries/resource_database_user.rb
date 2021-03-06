#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Copyright:: 2011-2016 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require File.join(File.dirname(__FILE__), 'resource_database')

class Chef
  class Resource
    class DatabaseUser < Chef::Resource::Database
      def initialize(name, run_context = nil)
        super
        @resource_name = :database_user
        @username = name

        @database_name = nil
        @table = nil
        @host = 'localhost'
        @privileges = [:all]
        @grant_option = false
        @require_ssl = false
        @require_x509 = false

        @allowed_actions.push(:create, :drop, :grant, :revoke)
        @action = :create
      end

      def database_name(arg = nil)
        set_or_return(
          :database_name,
          arg,
          kind_of: String
        )
      end

      def username(arg = nil)
        set_or_return(
          :username,
          arg,
          kind_of: String
        )
      end

      def require_ssl(arg = nil)
        set_or_return(
          :require_ssl,
          arg,
          kind_of: [TrueClass, FalseClass]
        )
      end

      def require_x509(arg = nil)
        set_or_return(
          :require_x509,
          arg,
          kind_of: [TrueClass, FalseClass]
        )
      end

      def password(arg = nil)
        set_or_return(
          :password,
          arg,
          kind_of: String
        )
      end

      def table(arg = nil)
        set_or_return(
          :table,
          arg,
          kind_of: String
        )
      end

      def host(arg = nil)
        set_or_return(
          :host,
          arg,
          kind_of: String
        )
      end

      def privileges(arg = nil)
        set_or_return(
          :privileges,
          arg,
          kind_of: Array
        )
      end

      def grant_option(arg = nil)
        set_or_return(
          :grant_option,
          arg,
          kind_of: [TrueClass, FalseClass], default: false
        )
      end
    end
  end
end
