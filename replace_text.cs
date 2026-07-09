using System;
using System.IO;
using System.Text;

class Program {
    static void Main() {
        string filePath = @"C:\Users\Jenn1817\Downloads\digit_crru_frontend\index.html";
        string content = File.ReadAllText(filePath, Encoding.UTF8);
        
        string target = "ดำเนแอดมแอดมินการต่อ</button>";
        string replacement = "ดำเนินการต่อ</button>\n                                    <div class=\"text-center mt-3\">\n                                        <button type=\"button\" onclick=\"window.skipOrderSearch()\" class=\"text-sm text-slate-500 hover:text-primary font-bold underline transition-colors\">ไม่มีข้อมูลในระบบ? กรอกข้อมูลเอง</button>\n                                    </div>";
        
        if (content.Contains(target)) {
            content = content.Replace(target, replacement);
            File.WriteAllText(filePath, content, new UTF8Encoding(false)); // No BOM
            Console.WriteLine("Replaced successfully!");
        } else {
            Console.WriteLine("Target not found!");
        }
    }
}
