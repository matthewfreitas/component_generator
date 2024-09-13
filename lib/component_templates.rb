# app/services/component_templates.rb
class ComponentTemplates
  TEMPLATES = {
    card: <<-HTML,
      <div class="card bg-white max-w-md flex-col flex rounded-lg shadow-lg">
        <!-- Card Header -->
        <div class="card-header bg-gray-800 text-white p-4 rounded-t-lg">
          <h2 class="text-xl font-semibold">Customizable Title</h2>
        </div>

        <!-- Card Body -->
        <div class="card-body p-6">
          <!-- Placeholder for content -->
        </div>
      </div>
    HTML
    form: <<-HTML,
      <form>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name">
        <input type="submit" value="Submit">
      </form>
    HTML
    table: <<-HTML
      <table class="min-w-full bg-white rounded-lg shadow">
          <thead class="bg-gray-50">
              <tr>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"></th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"></th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"></th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"></th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"></th>
                  <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"></th>
              </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
              <tr>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"></td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"></td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"></td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"></td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"></td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"></td>
              </tr>
          </tbody>
      </table>
    HTML
  }.freeze

  # Method to retrieve template by key (card, form, table)
  def self.get_template(type)
    TEMPLATES[type.to_sym]
  end
end