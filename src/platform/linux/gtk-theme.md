# أنكي لا يستخدم ثيم GTK في Gnome/Linux

تستطيع حل هذه المشكلة بإخبار أنكي عن ثيم GTK. نفذ الأوامر التالية في سطر الأوامر:

```shell
theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
echo "gtk-theme-name=$theme" >> ~/.gtkrc-2.0
echo "export GTK2_RC_FILES=$HOME/.gtkrc-2.0" >> ~/.profile
```

ثم سجل الخروج وادخل مجددًا إلى حاسوبك. يجب أن يتعرف أنكي على ثيم GTK الآن.
