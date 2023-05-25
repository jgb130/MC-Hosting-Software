import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public class MinecraftEulaManager
   {
    public MinecraftEulaManager()
       {

       }

    public boolean changeEulaAgreement(boolean agreement)
       {
        String eulaAgreementText = "eula=false";
        Path pathToEula = Path.of("/opt/minecraft/server/eula.txt");

        if(agreement == true)
           {
            eulaAgreementText = "eula=true";
           }

        try
           {
            Files.writeString(pathToEula, eulaAgreementText);
            System.out.println("Successfully changed eula agreement to " + agreement);
           }
         catch(Exception exc)
           {
            exc.printStackTrace();
            return false;
           }

        return true;
       }

    public static void main(String[] args)
       {
        MinecraftEulaManager eula = new MinecraftEulaManager();

        if(args.length == 0)
           {
            System.out.println("Invalid Usage! Please try again add either the -t or -f flag.");
           }
        else if(args[0].equals("-t"))
           {
            eula.changeEulaAgreement(true);
           }
        else if(args[0].equals("-f"))
           {
            eula.changeEulaAgreement(false);
           }
        else
           {
            System.out.println("Syntax Issue! Please try again using either the -t or -f flag.");
           }
       }
   }
