package fr.usmb.m1isc.compilation.simple;

import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws Exception {
        SimpleLexer lexer;
        Scanner in = new Scanner(System.in);
        if (args.length > 0)
            lexer = new SimpleLexer(new FileReader(args[0]));
        else
            lexer = new SimpleLexer(new InputStreamReader(System.in));
        @SuppressWarnings("deprecation")
        SimpleParser p = new SimpleParser(lexer);
        p.parse();
    }
}
