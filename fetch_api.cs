using System;
using System.Net.Http;
using System.Threading.Tasks;

class Program {
    static async Task Main() {
        var handler = new HttpClientHandler() { AllowAutoRedirect = true };
        using (var client = new HttpClient(handler)) {
            var url = "https://script.google.com/macros/s/AKfycbyCPFTT76JLJLo3cNjTDNXQPbofR3AmVEPxCOD9yzdW_73yFy92d-Q0OHAu26DgsA7x/exec?action=getInitialData";
            var response = await client.GetAsync(url);
            var content = await response.Content.ReadAsStringAsync();
            Console.WriteLine(content);
        }
    }
}
