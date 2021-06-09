
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JComponent;

import javax.swing.JFrame;	
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.UIManager;
import javax.swing.border.BevelBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.TitledBorder;

/* ################################################################################################################# */

import javax.swing.JProgressBar;
import javax.swing.JFileChooser;		// file choose

/* ################################################################################################################# */

import org.jnetpcap.PcapIf;

public class ChatFileDlg extends JFrame implements BaseLayer {

	public int nUpperLayerCount = 0;
	public String pLayerName = null;
	public BaseLayer p_UnderLayer = null;
	public ArrayList<BaseLayer> p_aUpperLayer = new ArrayList<BaseLayer>();
	BaseLayer UnderLayer;

	private static LayerManager m_LayerMgr = new LayerManager();

	private JTextField ChattingWrite;

	Container contentPane;

	JTextArea ChattingArea; 
	JTextArea srcMacAddress;
	JTextArea dstMacAddress;

	JLabel lblsrc;  // Label
	JLabel lbldst;

	JButton Setting_Button; // Port
	JButton Chat_send_Button; // data Send

	static JComboBox<String> NICComboBox;

	int adapterNumber = 0;

	String Text;
	
/* ################################################################################################################# */
	
	// File 관련
	File file;
	// ProgressBar, 각종 J 객체
	JProgressBar progressBar;
	JPanel fileTransferPanel;
	JPanel filePathPanel;
	JTextArea filePath;
	JButton file_Search_Button;
	JButton file_Transfer_Button;
	
/* ################################################################################################################# */
	

	public static void main(String[] args) {
	
		m_LayerMgr.AddLayer(new NILayer("NI"));
		m_LayerMgr.AddLayer(new EthernetLayer("Ethernet"));
		m_LayerMgr.AddLayer(new ChatAppLayer("ChatApp"));
		m_LayerMgr.AddLayer(new FileAppLayer("FileApp"));
		m_LayerMgr.AddLayer(new ChatFileDlg("GUI"));
		
		// 독립적으로 ChatApp과 FileApp을 작성
		m_LayerMgr.ConnectLayers(" NI ( *Ethernet ( *ChatApp ( *GUI ) *FileApp ( *GUI ) )");	
		
	}

	public ChatFileDlg(String pName) {
		pLayerName = pName;

		setTitle("Chat_File_Transfer");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(250, 250, 644, 425);
		contentPane = new JPanel();
		((JComponent) contentPane).setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		JPanel chattingPanel = new JPanel();// chatting panel
		chattingPanel.setBorder(new TitledBorder(UIManager.getBorder("TitledBorder.border"), "chatting",
				TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 0, 0)));
		chattingPanel.setBounds(10, 5, 360, 276);
		contentPane.add(chattingPanel);
		chattingPanel.setLayout(null);

		JPanel chattingEditorPanel = new JPanel();// chatting write panel
		chattingEditorPanel.setBounds(10, 15, 340, 210);
		chattingPanel.add(chattingEditorPanel);
		chattingEditorPanel.setLayout(null);

		ChattingArea = new JTextArea();
		ChattingArea.setEditable(false);
		ChattingArea.setBounds(0, 0, 340, 210);
		chattingEditorPanel.add(ChattingArea);// chatting edit

		JPanel chattingInputPanel = new JPanel();// chatting write panel
		chattingInputPanel.setBorder(new BevelBorder(BevelBorder.LOWERED, null, null, null, null));
		chattingInputPanel.setBounds(10, 230, 250, 20);
		chattingPanel.add(chattingInputPanel);
		chattingInputPanel.setLayout(null);

		ChattingWrite = new JTextField();
		ChattingWrite.setBounds(2, 2, 250, 20);// 249
		chattingInputPanel.add(ChattingWrite);
		ChattingWrite.setColumns(10);// writing area

		JPanel settingPanel = new JPanel(); //Setting 
		settingPanel.setBorder(new TitledBorder(UIManager.getBorder("TitledBorder.border"), "setting",
				TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 0, 0)));
		settingPanel.setBounds(380, 5, 236, 405);
		contentPane.add(settingPanel);
		settingPanel.setLayout(null);

		JPanel sourceAddressPanel = new JPanel();
		sourceAddressPanel.setBorder(new BevelBorder(BevelBorder.LOWERED, null, null, null, null));
		sourceAddressPanel.setBounds(10, 140, 170, 20);
		settingPanel.add(sourceAddressPanel);
		sourceAddressPanel.setLayout(null);

		lblsrc = new JLabel("Source Mac Address");
		lblsrc.setBounds(10, 115, 170, 20); 
		settingPanel.add(lblsrc); //panel

		srcMacAddress = new JTextArea();
		srcMacAddress.setBounds(2, 2, 170, 20); 
		sourceAddressPanel.add(srcMacAddress);// src address

		JPanel destinationAddressPanel = new JPanel();
		destinationAddressPanel.setBorder(new BevelBorder(BevelBorder.LOWERED, null, null, null, null));
		destinationAddressPanel.setBounds(10, 212, 170, 20);
		settingPanel.add(destinationAddressPanel);
		destinationAddressPanel.setLayout(null);

		lbldst = new JLabel("Destination Mac Address");
		lbldst.setBounds(10, 187, 190, 20);
		settingPanel.add(lbldst);

		dstMacAddress = new JTextArea();
		dstMacAddress.setBounds(2, 2, 170, 20);
		destinationAddressPanel.add(dstMacAddress);// dst address

		JLabel NICLabel = new JLabel("NIC List");
		NICLabel.setBounds(10, 20, 170, 20);
		settingPanel.add(NICLabel);

		NICComboBox = new JComboBox();
		NICComboBox.setBounds(10, 49, 170, 20);
		settingPanel.add(NICComboBox);
		
		
		NILayer tempNiLayer = (NILayer) m_LayerMgr.GetLayer("NI"); 

		for (int i = 0; i < tempNiLayer.getAdapterList().size(); i++) { 
			//NICComboBox.addItem(((NILayer) m_LayerMgr.GetLayer("NI")).GetAdapterObject(i).getDescription());
			PcapIf pcapIf = tempNiLayer.GetAdapterObject(i); //
			NICComboBox.addItem(pcapIf.getName()); // NIC 
		}

		NICComboBox.addActionListener(new ActionListener() { //combo 눌렀을 때의 동작

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				//adapterNumber = NICComboBox.getSelectedIndex();
				JComboBox jcombo = (JComboBox) e.getSource();
				adapterNumber = jcombo.getSelectedIndex();
				System.out.println("Index: " + adapterNumber); 
				try {
					srcMacAddress.setText("");
					srcMacAddress.append(get_MacAddress(((NILayer) m_LayerMgr.GetLayer("NI"))
							.GetAdapterObject(adapterNumber).getHardwareAddress()));

				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		try {// 
			srcMacAddress.append(get_MacAddress(
					((NILayer) m_LayerMgr.GetLayer("NI")).GetAdapterObject(adapterNumber).getHardwareAddress()));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		;

		Setting_Button = new JButton("Setting");// setting
		Setting_Button.setBounds(80, 270, 100, 20);
		Setting_Button.addActionListener(new setAddressListener());
		settingPanel.add(Setting_Button);// setting

		Chat_send_Button = new JButton("Send");
		Chat_send_Button.setBounds(270, 230, 80, 20);
		Chat_send_Button.addActionListener(new setAddressListener());
		chattingPanel.add(Chat_send_Button);// chatting send button
		
/* ################################################################################################################# */
		
		fileTransferPanel = new JPanel();// File transfer panel
		fileTransferPanel.setBorder(new TitledBorder(UIManager.getBorder("TitledBorder.border"), "FILE TRANSFER",
				TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 0, 0)));
		fileTransferPanel.setBounds(20, 300, 350, 110);
		contentPane.add(fileTransferPanel);
		fileTransferPanel.setLayout(null);
		
		filePath = new JTextArea();
		filePath.setEditable(true);
		filePath.setBounds(5, 20, 255, 30);
		fileTransferPanel.add(filePath);	// path edit
		
		file_Search_Button = new JButton("File Select...");// setting
		file_Search_Button.setBounds(270, 20, 70, 30);
		file_Search_Button.addActionListener(new setAddressListener());
		fileTransferPanel.add(file_Search_Button);	// path select button
		
		this.progressBar = new JProgressBar(0, 100);	// min, max
		this.progressBar.setBounds(5, 70, 260, 30);
		this.progressBar.setStringPainted(true);
		fileTransferPanel.add(this.progressBar);
		
		file_Transfer_Button = new JButton("Send");
		file_Transfer_Button.setEnabled(false);
		file_Transfer_Button.setBounds(270, 70, 70, 30);
		file_Transfer_Button.addActionListener(new setAddressListener());
		fileTransferPanel.add(file_Transfer_Button);// file send button
		
		

/* ################################################################################################################# */
		
		setVisible(true);

	}

	class setAddressListener implements ActionListener {
		@Override
		public void actionPerformed(ActionEvent e) {

			if (e.getSource() == Setting_Button) { //setting 

				if (Setting_Button.getText() == "Reset") { //reset 
					srcMacAddress.setText("");  
					dstMacAddress.setText("");  
					Setting_Button.setText("Setting"); 
					srcMacAddress.setEnabled(true);  
					dstMacAddress.setEnabled(true);  
				}  
				else { 
					 
					byte[] srcAddress = new byte[6];
					byte[] dstAddress = new byte[6];

					String src = srcMacAddress.getText(); //MAC  String byte
					String dst = dstMacAddress.getText();

					String[] byte_src = src.split("-"); //Sting MAC 
					for (int i = 0; i < 6; i++) {
						srcAddress[i] = (byte) Integer.parseInt(byte_src[i], 16); // 16 bits (2byte)
					}

					String[] byte_dst = dst.split("-");//Sting MAC 
					for (int i = 0; i < 6; i++) {
						dstAddress[i] = (byte) Integer.parseInt(byte_dst[i], 16); // 16 bits (2byte)
					}

					((EthernetLayer) m_LayerMgr.GetLayer("Ethernet")).SetEnetSrcAddress(srcAddress); 
					((EthernetLayer) m_LayerMgr.GetLayer("Ethernet")).SetEnetDstAddress(dstAddress); 

					((NILayer) m_LayerMgr.GetLayer("NI")).SetAdapterNumber(adapterNumber);

					Setting_Button.setText("Reset"); //setting 
					dstMacAddress.setEnabled(false);  
					srcMacAddress.setEnabled(false);  
				} 
			}

			if (e.getSource() == Chat_send_Button) { //send  
				if (Setting_Button.getText() == "Reset") { 
					String input = ChattingWrite.getText(); 
					ChattingArea.append("[SEND] : " + input + "\n"); 
					byte[] bytes = input.getBytes(); 
					
					((ChatAppLayer)m_LayerMgr.GetLayer("ChatApp")).Send(bytes, bytes.length);
					// chatApplayer
					ChattingWrite.setText(""); 
					
				} else {
					JOptionPane.showMessageDialog(null, "Address Setting Error!.");
				}
			}
			
			// file select 
			if (e.getSource() == file_Search_Button) { // file select  
				JFileChooser fileChooser = new JFileChooser();
				int file_path = fileChooser.showOpenDialog(null);
				if (file_path == JFileChooser.APPROVE_OPTION) {
					file = fileChooser.getSelectedFile();
					filePath.setText(file.getPath());
					file_Search_Button.setEnabled(true);
					filePath.setEnabled(false);
					file_Transfer_Button.setEnabled(true);				// transfer button 활성화
					progressBar.setValue(0); // progressBar init
			
				}
			}
			// file transfer
			if (e.getSource() == file_Transfer_Button) {
				
			}
			
		}
	}
	

	public String get_MacAddress(byte[] byte_MacAddress) { //MAC Byte

		String MacAddress = "";
		for (int i = 0; i < 6; i++) { 
			
			MacAddress += String.format("%02X%s", byte_MacAddress[i], (i < MacAddress.length() - 1) ? "" : "");
			
			if (i != 5) {
				
				MacAddress += "-";
			}
		} 
		System.out.println("mac_address:" + MacAddress);
		return MacAddress;
	}

	public boolean Receive(byte[] input) { // Receive
		if (input != null) {
			byte[] data = input;   //byte  input data
			Text = new String(data); 
			ChattingArea.append("[RECV] : " + Text + "\n"); 
			return false;
		}
		return false ;
	}
/* ################################################################################################################# */
	
	public File getFile() {
		return this.getFile();
	}
	
/* ################################################################################################################# */
	
	@Override
	public void SetUnderLayer(BaseLayer pUnderLayer) {
		// TODO Auto-generated method stub
		if (pUnderLayer == null)
			return;
		this.p_UnderLayer = pUnderLayer;
	}

	@Override
	public void SetUpperLayer(BaseLayer pUpperLayer) {
		// TODO Auto-generated method stub
		if (pUpperLayer == null)
			return;
		this.p_aUpperLayer.add(nUpperLayerCount++, pUpperLayer);
		// nUpperLayerCount++;
	}

	@Override
	public String GetLayerName() {
		// TODO Auto-generated method stub
		return pLayerName;
	}

	@Override
	public BaseLayer GetUnderLayer() {
		// TODO Auto-generated method stub
		if (p_UnderLayer == null)
			return null;
		return p_UnderLayer;
	}

	@Override
	public BaseLayer GetUpperLayer(int nindex) {
		// TODO Auto-generated method stub
		if (nindex < 0 || nindex > nUpperLayerCount || nUpperLayerCount < 0)
			return null;
		return p_aUpperLayer.get(nindex);
	}

	@Override
	public void SetUpperUnderLayer(BaseLayer pUULayer) {
		this.SetUpperLayer(pUULayer);
		pUULayer.SetUnderLayer(this);

	}

}
