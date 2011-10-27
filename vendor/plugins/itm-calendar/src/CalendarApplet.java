import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.swing.BorderFactory;
import javax.swing.JApplet;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

public class CalendarApplet extends JApplet {

	private static final long serialVersionUID = -7904606577484119803L;

	private static final SimpleDateFormat dateFormat = new SimpleDateFormat(
			"yyyy. MMMMM dd.");

	private static final String[] dayNames = { "H", "K", "Sze", "Cs", "P",
			"Szo", "V" };

	public void createGUI() {

		Container contentPane = getContentPane();

		contentPane.setLayout(new BorderLayout());

		contentPane.setBackground(new Color(0.0f, 0.0f, 0.0f, 0.0f));
		// contentPane.setBackground(Color.blue);

		JLabel dateLabel = new JLabel(dateFormat.format(new Date()), JLabel.CENTER);
		dateLabel.setToolTipText("Applet version 0.6");
		
		contentPane.add(dateLabel, BorderLayout.NORTH);

		JPanel calendarPanel = new JPanel(new GridLayout(0, 8));
		calendarPanel.setOpaque(false);

		calendarPanel.add(new JLabel(" ")); // bal felső sarok üres

		for (int i = 0; i < dayNames.length; i++) {
			calendarPanel.add(new JLabel(dayNames[i], JLabel.CENTER));
		}

		Calendar firstDayOfThisMonth = Calendar.getInstance(new Locale("hu"));
		firstDayOfThisMonth.set(Calendar.DAY_OF_MONTH, 1);
		//firstDayOfThisMonth.set(Calendar.MONTH, Calendar.DECEMBER);
		firstDayOfThisMonth.setFirstDayOfWeek(Calendar.MONDAY);

		int gapCount = firstDayOfThisMonth.get(Calendar.DAY_OF_WEEK)
				- Calendar.MONDAY;
		if (gapCount < 0) {
			gapCount = gapCount + 7;
		}

		//System.out.println(dateFormat.format(firstDayOfThisMonth.getTime()));
		//System.out.println("Gapcount=" + gapCount);

		JLabel weekLabel = new JLabel(Integer.toString(firstDayOfThisMonth.get(Calendar.WEEK_OF_YEAR) - 1), JLabel.CENTER);
		weekLabel.setForeground(Color.GRAY);
		calendarPanel.add(weekLabel);
		// Feltölteni az üres helyeket
		for (int i = 0; i < gapCount; i++) {
			calendarPanel.add(new JLabel(" "));
		}

		Calendar currentDay = Calendar.getInstance(new Locale("hu"));
		currentDay.setFirstDayOfWeek(Calendar.MONDAY);
		currentDay.set(Calendar.DAY_OF_MONTH, 1);
		//currentDay.set(Calendar.MONTH, Calendar.DECEMBER);
		
		Calendar today = Calendar.getInstance(new Locale("hu"));

		while (currentDay.get(Calendar.MONTH) == firstDayOfThisMonth.get(Calendar.MONTH)) {
			JLabel dayLabel = new JLabel(Integer.toString(currentDay.get(Calendar.DAY_OF_MONTH)), JLabel.CENTER);
			
			if (currentDay.equals(today)) {
				dayLabel.setBorder(BorderFactory.createLineBorder(Color.BLACK));
			} else {
				if (currentDay.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
					dayLabel.setForeground(Color.RED);
				}
			}
			
			calendarPanel.add(dayLabel);

			if (currentDay.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
				weekLabel = new JLabel(Integer.toString(currentDay.get(Calendar.WEEK_OF_YEAR)), JLabel.CENTER);
				weekLabel.setForeground(Color.GRAY);
				calendarPanel.add(weekLabel);
			}

			currentDay.add(Calendar.DAY_OF_MONTH, 1);
		}
		contentPane.add(calendarPanel, BorderLayout.CENTER);

		contentPane.add(new JLabel("Ma " + getNevNap() + " napja van."),
				BorderLayout.SOUTH);

	}

	public String getNevNap() {
		String[] napok = null;
		Calendar ma = Calendar.getInstance();

		switch (ma.get(Calendar.MONTH)) {
		case Calendar.JANUARY:
			napok = new String[] { "ÚJÉV, Fruzsina", "Ábel",
					"Genovéva, Benjámin", "Titusz, Leona", "Simon",
					"Boldizsár", "Attila, Ramóna", "Gyöngyvér", "Marcell",
					"Melánia", "Ágota", "Ernő", "Veronika", "Bódog",
					"Lóránt, Loránd", "Gusztáv", "Antal, Antónia", "Piroska",
					"Sára, Márió", "Fábián, Sebestyén", "Ágnes",
					"Vince, Artúr", "Zelma, Rajmund", "Timót", "Pál",
					"Vanda, Paula", "Angelika", "Károly, Karola", "Adél",
					"Martina, Gerda", "Marcella" };
			break;
		case Calendar.FEBRUARY:
			if (((GregorianCalendar) ma).isLeapYear(ma.get(Calendar.YEAR))) { // ha
																				// szökőév
				napok = new String[] { "Ignác", "Karolina, Aida", "Balázs",
						"Ráhel, Csenge", "Ágota, Ingrid", "Dorottya, Dóra",
						"Tódor, Rómeó", "Aranka", "Abigél, Alex", "Elvira",
						"Bertold, Marietta", "Lívia, Lídia", "Ella, Linda",
						"Bálint, Valentin", "Kolos, Georgina",
						"Julianna, Lilla", "Donát", "Bernadett", "Zsuzsanna",
						"Aladár, Álmos", "Eleonóra", "Gerzson", "Alfréd",
						"Szőkőnap", "Mátyás", "Géza", "Edina", "Ákos, Bátor",
						"Elemér" };
			} else {
				napok = new String[] { "Ignác", "Karolina, Aida", "Balázs",
						"Ráhel, Csenge", "Ágota, Ingrid", "Dorottya, Dóra",
						"Tódor, Rómeó", "Aranka", "Abigél, Alex", "Elvira",
						"Bertold, Marietta", "Lívia, Lídia", "Ella, Linda",
						"Bálint, Valentin", "Kolos, Georgina",
						"Julianna, Lilla", "Donát", "Bernadett", "Zsuzsanna",
						"Aladár, Álmos", "Eleonóra", "Gerzson", "Alfréd",
						"Mátyás", "Géza", "Edina", "Ákos, Bátor", "Elemér" };
			}
			break;
		case Calendar.MARCH:
			napok = new String[] { "Albin", "Lujza", "Kornélia", "Kázmér",
					"Adorján, Adrián", "Leonóra, Inez", "Tamás",
					"NŐNAP, Zoltán", "Franciska, Fanni", "Ildikó", "Szilárd",
					"Gergely", "Krisztián, Ajtony", "Matild",
					"NEMZETI ÜNNEP, Kristóf", "Henrietta", "Gertrúd, Patrik",
					"Sándor, Ede", "József, Bánk", "Klaudia", "Benedek",
					"Beáta, Izolda", "Emőke", "Gábor, Karina", "Irén, Irisz",
					"Emánuel", "Hajnalka", "Gedeon, Johanna", "Auguszta",
					"Zalán", "Árpád" };
			break;
		case Calendar.APRIL:
			napok = new String[] { "Hugó", "Áron", "Buda, Richárd", "Izidor",
					"Vince", "Vilmos, Bíborka", "Herman", "Dénes", "Erhard",
					"Zsolt", "Leó, Szaniszló", "Gyula", "Ida", "Tibor",
					"Anasztázia, Tas", "Csongor", "Rudolf", "Andrea, Ilma",
					"Emma", "Tivadar", "Konrád", "Csilla, Noémi", "Béla",
					"György", "Márk", "Ervin", "Zita", "Valéria", "Péter",
					"Katalin, Kitti" };
			break;
		case Calendar.MAY:
			napok = new String[] { "MUNKA ÜNN.,Fülöp, Jakab", "Zsigmond",
					"Tímea, Irma", "Mónika, Flórián", "Györgyi",
					"Ivett, Frida", "Gizella", "Mihály", "Gergely",
					"Ármin, Pálma", "Ferenc", "Pongrác", "Szervác, Imola",
					"Bonifác", "Zsófia, Szonja", "Mózes, Botond", "Paszkál",
					"Erik, Alexandra", "Ivó, Milán", "Bernát, Felícia",
					"Konstantin", "Júlia, Rita", "Dezső", "Eszter, Eliza",
					"Orbán", "Fülöp, Evelin", "Hella", "Emil, Csanád",
					"Magdolna", "Janka, Zsanett", "Angéla, Petronella" };
			break;
		case Calendar.JUNE:
			napok = new String[] { "Tünde", "Kármen, Anita", "Klotild",
					"Bulcsú", "Fatime", "Norbert, Cintia", "Róbert", "Medárd",
					"Félix", "Margit, Gréta", "Barnabás", "Villő",
					"Antal, Anett", "Vazul", "Jolán, Vid", "Jusztin",
					"Laura, Alida", "Arnold, Levente", "Gyárfás", "Rafael",
					"Alajos, Leila", "Paulina", "Zoltán", "Iván", "Vilmos",
					"János, Pál", "László", "Levente, Irén", "Péter, Pál",
					"Pál" };
			break;
		case Calendar.JULY:
			napok = new String[] { "Tihamér, Annamária", "Ottó",
					"Kornél, Soma", "Ulrik", "Emese, Sarolta", "Csaba",
					"Appolónia", "Ellák", "Lukrécia", "Amália", "Nóra, Lili",
					"Izabella, Dalma", "Jenő", "Őrs, Stella", "Henrik, Roland",
					"Valter", "Endre, Elek", "Frigyes", "Emília", "Illés",
					"Dániel, Daniella", "Magdolna", "Lenke", "Kinga, Kincső",
					"Kristóf, Jakab", "Anna, Anikó", "Olga, Liliána",
					"Szabolcs", "Márta, Flóra", "Judit, Xénia", "Oszkár" };
			break;
		case Calendar.AUGUST:
			napok = new String[] { "Boglárka", "Lehel", "Hermina",
					"Domonkos, Dominika", "Krisztina", "Berta, Bettina",
					"Ibolya", "László", "Emőd", "Lőrinc", "Zsuzsanna, Tiborc",
					"Klára", "Ipoly", "Marcell", "Mária", "Ábrahám", "Jácint",
					"Ilona", "Huba", "ALKOTMÁNY ÜNN., István", "Sámuel, Hajna",
					"Menyhért, Mirjam", "Bence", "Bertalan", "Lajos, Patrícia",
					"Izsó", "Gáspár", "Ágoston", "Beatrix, Erna", "Rózsa",
					"Erika, Bella" };
			break;
		case Calendar.SEPTEMBER:
			napok = new String[] { "Egyed, Egon", "Rebeka, Dorina", "Hilda",
					"Rozália", "Viktor, Lőrinc", "Zakariás", "Regina",
					"Mária, Adrienn", "Ádám", "Nikolett, Hunor", "Teodóra",
					"Mária", "Kornél", "Szeréna, Roxána", "Enikő, Melitta",
					"Edit", "Zsófia", "Diána", "Vilhelmina", "Friderika",
					"Máté, Mirella", "Móric", "Tekla", "Gellért, Mercédesz",
					"Eufrozina, Kende", "Jusztina", "Adalbert", "Vencel",
					"Mihály", "Jeromos" };
			break;
		case Calendar.OCTOBER:
			napok = new String[] { "Malvin", "Petra", "Helga", "Ferenc",
					"Aurél", "Brúnó, Renáta", "Amália", "Koppány", "Dénes",
					"Gedeon", "Brigitta", "Miksa", "Kálmán, Ede", "Helén",
					"Teréz", "Gál", "Hedvig", "Lukács", "Nándor", "Vendel",
					"Orsolya", "Előd", "KÖZT.KIKIÁLT., Gyöngyi", "Salamon",
					"Blanka, Bianka", "Dömötör", "Szabina",
					"Simon, Szimonetta", "Nárcisz", "Alfonz", "Farkas" };
			break;
		case Calendar.NOVEMBER:
			napok = new String[] { "Marianna", "Achilles", "Győző", "Károly",
					"Imre", "Lénárd", "Rezső", "Zsombor", "Tivadar", "Réka",
					"Márton", "Jónás, Renátó", "Szilvia", "Aliz",
					"Albert, Lipót", "Ödön", "Hortenzia, Gergő", "Jenő",
					"Erzsébet", "Jolán", "Olivér", "Cecília",
					"Kelemen, Klementina", "Emma", "Katalin", "Virág",
					"Virgil", "Stefánia", "Taksony", "András, Andor" };
			break;
		case Calendar.DECEMBER:
			napok = new String[] { "Elza", "Melinda, Vivien", "Ferenc, Olívia",
					"Borbála, Barbara", "Vilma", "Miklós", "Ambrus", "Mária",
					"Natália", "Judit", "Árpád", "Gabriella", "Luca, Otília",
					"Szilárda", "Valér", "Etelka, Aletta", "Lázár, Olimpia",
					"Auguszta", "Viola", "Teofil", "Tamás", "Zénó", "Viktória",
					"Ádám, Éva", "KARÁCSONY, Eugénia", "KARÁCSONY, István",
					"János", "Kamilla", "Tamás, Tamara", "Dávid", "Szilveszter" };
		}

		return napok[ma.get(Calendar.DAY_OF_MONTH) - 1];
	}

	@Override
	public void init() {
		try {
			SwingUtilities.invokeAndWait(new Runnable() {
				public void run() {
					createGUI();
				}
			});
		} catch (Exception e) {
			System.err.println("createGUI didn't complete successfully");
		}
	}

}
