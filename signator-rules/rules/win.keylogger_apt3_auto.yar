rule win_keylogger_apt3_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.keylogger_apt3."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.keylogger_apt3"
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
        $sequence_0 = { c3 84db 74c9 8b04cd74104300 5f 5e 5b }
            // n = 7, score = 300
            //   c3                   | ret                 
            //   84db                 | test                bl, bl
            //   74c9                 | je                  0xffffffcb
            //   8b04cd74104300       | mov                 eax, dword ptr [ecx*8 + 0x431074]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_1 = { 57 6803000010 55 ffd6 }
            // n = 4, score = 300
            //   57                   | push                edi
            //   6803000010           | push                0x10000003
            //   55                   | push                ebp
            //   ffd6                 | call                esi

        $sequence_2 = { 55 bd01000000 85f6 0f84db000000 8b3d???????? eb04 }
            // n = 6, score = 300
            //   55                   | push                ebp
            //   bd01000000           | mov                 ebp, 1
            //   85f6                 | test                esi, esi
            //   0f84db000000         | je                  0xe1
            //   8b3d????????         |                     
            //   eb04                 | jmp                 6

        $sequence_3 = { 50 c644241000 e8???????? 8b0d???????? 83c40c }
            // n = 5, score = 300
            //   50                   | push                eax
            //   c644241000           | mov                 byte ptr [esp + 0x10], 0
            //   e8????????           |                     
            //   8b0d????????         |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_4 = { ffd0 68???????? 8d4d00 e8???????? 68???????? }
            // n = 5, score = 300
            //   ffd0                 | call                eax
            //   68????????           |                     
            //   8d4d00               | lea                 ecx, [ebp]
            //   e8????????           |                     
            //   68????????           |                     

        $sequence_5 = { e8???????? 83c428 83bea401000000 7646 8d542418 }
            // n = 5, score = 300
            //   e8????????           |                     
            //   83c428               | add                 esp, 0x28
            //   83bea401000000       | cmp                 dword ptr [esi + 0x1a4], 0
            //   7646                 | jbe                 0x48
            //   8d542418             | lea                 edx, [esp + 0x18]

        $sequence_6 = { 83f86f 7520 56 e8???????? }
            // n = 4, score = 300
            //   83f86f               | cmp                 eax, 0x6f
            //   7520                 | jne                 0x22
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_7 = { 8d4dec 51 c645fc04 e8???????? 68???????? }
            // n = 5, score = 300
            //   8d4dec               | lea                 ecx, [ebp - 0x14]
            //   51                   | push                ecx
            //   c645fc04             | mov                 byte ptr [ebp - 4], 4
            //   e8????????           |                     
            //   68????????           |                     

        $sequence_8 = { 02c9 807c043431 7503 80c901 40 83f808 7cee }
            // n = 7, score = 300
            //   02c9                 | add                 cl, cl
            //   807c043431           | cmp                 byte ptr [esp + eax + 0x34], 0x31
            //   7503                 | jne                 5
            //   80c901               | or                  cl, 1
            //   40                   | inc                 eax
            //   83f808               | cmp                 eax, 8
            //   7cee                 | jl                  0xfffffff0

        $sequence_9 = { ffd7 8b0d???????? 8d442420 50 51 e8???????? 8d9600020000 }
            // n = 7, score = 300
            //   ffd7                 | call                edi
            //   8b0d????????         |                     
            //   8d442420             | lea                 eax, [esp + 0x20]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8d9600020000         | lea                 edx, [esi + 0x200]

    condition:
        7 of them and filesize < 761856
}