string text = "pato";
string textResult = "";

for (int i=text.Length-1;i>=0;i--){
    textResult += text[i];
}

Console.WriteLine(textResult);