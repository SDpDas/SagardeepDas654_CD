public class Intm_code_gen {
    static int tempCount = 1;

    public static void main(String[] args) {
        String expression = "a+b*c-d";
        generateIntermediateCode(expression);
    }

    public static void generateIntermediateCode(String expression) {
        char[] tokens = expression.toCharArray();

        for (int i = 0; i < tokens.length - 2; i += 2) {
            char left = tokens[i];
            char operator = tokens[i + 1];
            char right = tokens[i + 2];

            if (operator == '*' || operator == '/') {
                String temp = "t" + tempCount++;
                System.out.println(temp + " = " + left + " " + operator + " " + right);
                tokens[i + 2] = temp.charAt(0);
            }
        }

        for (int i = 0; i < tokens.length - 2; i += 2) {
            char left = tokens[i];
            char operator = tokens[i + 1];
            char right = tokens[i + 2];

            if (operator == '+' || operator == '-') {
                String temp = "t" + tempCount++;
                System.out.println(temp + " = " + left + " " + operator + " " + right);
                tokens[i + 2] = temp.charAt(0);
            }
        }
    }
}

