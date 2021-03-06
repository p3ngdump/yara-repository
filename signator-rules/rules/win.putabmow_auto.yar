rule win_putabmow_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.putabmow."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.putabmow"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 57 8b01 894510 8b4104 894514 8d442464 0f43442464 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   894510               | mov                 dword ptr [ebp + 0x10], eax
            //   8b4104               | mov                 eax, dword ptr [ecx + 4]
            //   894514               | mov                 dword ptr [ebp + 0x14], eax
            //   8d442464             | lea                 eax, [esp + 0x64]
            //   0f43442464           | cmovae              eax, dword ptr [esp + 0x64]

        $sequence_1 = { 50 e8???????? c645fc02 c706???????? c645fc04 837de810 720b }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   c645fc02             | mov                 byte ptr [ebp - 4], 2
            //   c706????????         |                     
            //   c645fc04             | mov                 byte ptr [ebp - 4], 4
            //   837de810             | cmp                 dword ptr [ebp - 0x18], 0x10
            //   720b                 | jb                  0xd

        $sequence_2 = { 668901 e8???????? c745fc00000000 c7461cbc017300 c745fcffffffff 8bc6 }
            // n = 6, score = 100
            //   668901               | mov                 word ptr [ecx], ax
            //   e8????????           |                     
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   c7461cbc017300       | mov                 dword ptr [esi + 0x1c], 0x7301bc
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   8bc6                 | mov                 eax, esi

        $sequence_3 = { 8d4e34 c7411407000000 50 c7411000000000 68???????? 668901 e8???????? }
            // n = 7, score = 100
            //   8d4e34               | lea                 ecx, [esi + 0x34]
            //   c7411407000000       | mov                 dword ptr [ecx + 0x14], 7
            //   50                   | push                eax
            //   c7411000000000       | mov                 dword ptr [ecx + 0x10], 0
            //   68????????           |                     
            //   668901               | mov                 word ptr [ecx], ax
            //   e8????????           |                     

        $sequence_4 = { 56 e8???????? 59 8365fc00 8b049dc8eb7300 f644380401 7413 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   8b049dc8eb7300       | mov                 eax, dword ptr [ebx*4 + 0x73ebc8]
            //   f644380401           | test                byte ptr [eax + edi + 4], 1
            //   7413                 | je                  0x15

        $sequence_5 = { 50 e8???????? 83c410 c684242802000010 8bd0 8d4c241c e8???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   c684242802000010     | mov                 byte ptr [esp + 0x228], 0x10
            //   8bd0                 | mov                 edx, eax
            //   8d4c241c             | lea                 ecx, [esp + 0x1c]
            //   e8????????           |                     

        $sequence_6 = { 85c9 7507 8d4201 8be5 5d c3 }
            // n = 6, score = 100
            //   85c9                 | test                ecx, ecx
            //   7507                 | jne                 9
            //   8d4201               | lea                 eax, [edx + 1]
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 

        $sequence_7 = { 33c0 89442428 39471c 0f864f340000 8d0c40 8b4718 c1e103 }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   39471c               | cmp                 dword ptr [edi + 0x1c], eax
            //   0f864f340000         | jbe                 0x3455
            //   8d0c40               | lea                 ecx, [eax + eax*2]
            //   8b4718               | mov                 eax, dword ptr [edi + 0x18]
            //   c1e103               | shl                 ecx, 3

        $sequence_8 = { 00c7 03e7 00cc 03e8 00d1 03e8 00d6 }
            // n = 7, score = 100
            //   00c7                 | add                 bh, al
            //   03e7                 | add                 esp, edi
            //   00cc                 | add                 ah, cl
            //   03e8                 | add                 ebp, eax
            //   00d1                 | add                 cl, dl
            //   03e8                 | add                 ebp, eax
            //   00d6                 | add                 dh, dl

        $sequence_9 = { fb 007a05 fc 008005fb0088 05fb008e05 f5 0031 }
            // n = 7, score = 100
            //   fb                   | sti                 
            //   007a05               | add                 byte ptr [edx + 5], bh
            //   fc                   | cld                 
            //   008005fb0088         | add                 byte ptr [eax - 0x77ff04fb], al
            //   05fb008e05           | add                 eax, 0x58e00fb
            //   f5                   | cmc                 
            //   0031                 | add                 byte ptr [ecx], dh

    condition:
        7 of them and filesize < 704512
}